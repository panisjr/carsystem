import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-user-management',
  templateUrl: './user-management.component.html',
  styleUrl: './user-management.component.css',
})
export class UserManagementComponent implements OnInit {
  //User Credentials
  id: number = 0;
  firstname: string = '';
  middlename: string = '';
  lastname: string = '';
  email: string = '';
  contact: string = '';
  role: string = 'Customer';
  status: boolean = true;
  password: string = '';
  confirm_password: string = '';
  profileFile: File | null = null;

  users: any[] = [];
  dtoptions: any = {}; // Add this for datatable options
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  editing: boolean = false;
  loading: boolean = false;
  userData: any = {};
  constructor(
    private serverService: ServerService,
    private token: TokenService,
    private router: Router,
    private toastr: ToastrService
  ) {}
  ngOnInit(): void {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10,
    };
    this.getUsers();
    const data = this.token.get();
    this.userData = data.user;
  }

  getUsers(): void {
    this.serverService.getUsers().subscribe(
      (response: any) => {
        this.users = response;
        if (this.users) {
          this.dtTrigger.unsubscribe();
        }
        this.dtTrigger.next(null); // Trigger datatable refresh after data fetch
      },
      (error) => {
        console.error('Error fetching users:', error);
      }
    );
  }

  onFileSelected(event: any) {
    if (event.target.files && event.target.files.length > 0) {
      this.profileFile = event.target.files[0];
    }
  }
  signUp() {
    const formData = new FormData();
    formData.append('firstname', this.firstname);
    formData.append('middlename', this.middlename);
    formData.append('lastname', this.lastname);
    formData.append('email', this.email);
    formData.append('contact', this.contact);
    formData.append('role', this.role);
    formData.append('status', String(this.status));
    formData.append('password', this.password);
    formData.append('confirm_password', this.confirm_password);
    if (this.profileFile) {
      formData.append('profileFile', this.profileFile);
    }
    this.serverService.signUp(formData).subscribe(
      (response: any) => {
        this.toastr.success(response.message);
        this.getUsers();
        this.resetForm();
      },
      (error) => {
        this.toastr.error(error.error.message);
      }
    );
  }

  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
  resetForm() {
    this.editing = false;
    this.firstname = '';
    this.middlename = '';
    this.lastname = '';
    this.email = '';
    this.contact = '';
    this.password = '';
    this.confirm_password = '';
    this.profileFile = null;
  }
  deactivate(accountId: number, accountStatus: any) {
    if (accountId === this.userData.id) {
      this.loading = false;
      this.toastr.error(
        'Your are currently logged in!',
        'You cannot deactivate your own account.'
      );
      setTimeout(() => {
        this.errorMessage = null;
      }, 3500);
      return; // Stop further execution
    }
    this.loading = true;
    this.serverService.deactivate(accountId, accountStatus).subscribe(
      (response: any) => {
        this.loading = false;
        this.toastr.success(response.message);
        this.status = false;
        this.getUsers();
      },
      (error) => {
        this.toastr.error(error.error.message);
      }
    );
  }
  // To delete the user account
  setDelete(accountId: number) {
    const account = this.users.find((a) => a.id === accountId);
    if (account) {
      this.firstname = account.firstname;
      this.middlename = account.middlename;
      this.lastname = account.lastname;
      this.email = account.email;
      this.contact = account.contact;
      this.role = account.role;
      this.id = account.id;
    }
  }
  deleteUser(accountId: number) {
    this.loading = true;
    if (accountId === this.userData.id) {
      this.loading = false;
      this.toastr.error(
        'You cannot delete your own account.',
        'Error Deleting Account!'
      );
      return; // Stop further execution
    }
    this.serverService.deleteUser(accountId).subscribe(
      (resultData: any) => {
        this.loading = false;
        this.toastr.success(resultData.message);
        // To store in history
        const userID = resultData.data.id;
        const accountID = this.userData.id;
        const accountFirst = this.userData.firstname;
        const accountLast = this.userData.lastname;
        const accountRole = this.userData.role;
        this.serverService
          .history(
            'Delete user account.',
            userID,
            accountID,
            accountFirst,
            accountLast,
            accountRole
          )
          .subscribe(() => {
            console.log('Action added to history successfully');
          });
        this.resetForm();
        this.getUsers();
      },
      (error) => {
        this.loading = false;
        this.toastr.error(error.error.message);
      }
    );
  }

  setEdit(accountId: number) {
    this.editing = true;
    const account = this.users.find((a) => a.id === accountId);
    if (account) {
      this.firstname = account.firstname;
      this.middlename = account.middlename;
      this.lastname = account.lastname;
      this.email = account.email;
      this.contact = account.contact;
      this.role = account.role;
      this.profileFile = account.profileFile;
      this.id = account.id;
    }
  }
  // To update user Credentials
  updateUser(accountId: number) {
    this.loading = true;
    const formData = new FormData();
    formData.append('firstname', this.firstname);
    formData.append('middlename', this.middlename);
    formData.append('lastname', this.lastname);
    formData.append('email', this.email);
    formData.append('contact', this.contact);
    formData.append('role', this.role);
    formData.append('status', String(this.status));
    formData.append('password', this.password);
    formData.append('confirm_password', this.confirm_password);
    if (this.profileFile) {
      formData.append('profileFile', this.profileFile);
    }
    if (accountId === this.userData.id) {
      console.log(this.userData.email);
      if (this.role !== 'Admin') { // Access 'role' property directly from 'formData'
        this.loading = false;
        this.toastr.error(
          'Cannot change role when you are currently logged in.',
          'Error Updating Account!'
        );
        return; // Stop further execution
      } else if (formData.get('email') !== this.userData.email) { // Access email from 'formData'
        console.log('asdfasdf')
        this.loading = false;
        this.toastr.error(
          'Cannot change email when you are currently logged in.',
          'Error Updating Account!'
        );
        return; // Stop further execution
      }
    }
    this.serverService.updateUser(accountId, formData).subscribe(
      (resultData: any) => {
        this.loading = false;
        this.toastr.success(resultData.message);
        const userID = resultData.data.id;
        const accountID = this.userData.id;
        const accountFirst = this.userData.firstname;
        const accountLast = this.userData.lastname;
        const accountRole = this.userData.role;
        this.serverService
          .history(
            'Update user account.',
            userID,
            accountID,
            accountFirst,
            accountLast,
            accountRole
          )
          .subscribe(() => {
            console.log('Action added to history successfully');
          });
        this.getUsers();
      },
      (error) => {
        this.loading = false;
        this.toastr.error(error.error.message);
      }
    );
  }
  
}
