import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit, OnDestroy {
  id: number = 0;
  accounts: any[] = [];
  firstname: string = '';
  middlename: string = ' ';
  lastname: string = '';
  role: string = 'Borrower';
  email: string = '';
  contact: string = '';
  password: string = '';
  confirm_password: string = '';
  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;
  dataTable: any;

  constructor(
    private router: Router,
    private serverService: ServerService,
    private token: TokenService
  ) {}

  ngOnInit(): void {
    this.fetchAccounts();
  }

  ngOnDestroy(): void {
    if (this.dataTable) {
      this.dataTable.destroy();
    }
  }

  fetchAccounts(): void {
    this.serverService.get().subscribe(
      (response: any) => {
        this.accounts = response;
        if (this.dataTable) {
          this.dataTable.clear().rows.add(this.accounts).draw();
        }
      },
      (error) => {
        console.error('Error fetching accounts:', error);
      }
    );
  }

  closeModal(): void {
    this.errorMessage = null;
    this.successMessage = null;
  }

  logout(): void {
    this.token.remove();
    this.router.navigate(['/login']);
  }

  accountByID(): void {
    const id = Number(sessionStorage.getItem('user_id'));
    const account = this.accounts.find(a => a.id === id);
    if (account) {
      this.id = account.id;
      this.firstname = account.firstname;
      this.lastname = account.lastname;
      this.role = account.role;
    }
  }

  register(): void {
    this.loading = true;
    if (this.password !== this.confirm_password) {
      this.loading = false;
      this.errorMessage = "Passwords do not match!";
      setTimeout(() => this.errorMessage = null, 2500);
      return;
    }

    const bodyData = {
      firstname: this.firstname,
      middlename: this.middlename,
      lastname: this.lastname,
      email: this.email,
      contact: this.contact,
      password: this.password,
      confirm_password: this.confirm_password,
      role: this.role
    };

    this.serverService.signIn(bodyData).subscribe(
      (resultData: any) => {
        this.loading = false;
        this.successMessage = resultData.message;
        this.fetchAccounts();
        this.resetForm();
        setTimeout(() => this.successMessage = null, 2500);
      },
      (error) => {
        this.loading = false;
        this.errorMessage = error.error.message;
        setTimeout(() => this.errorMessage = null, 2500);
      }
    );
  }

  setEdit(accountId: number): void {
    const account = this.accounts.find(a => a.id === accountId);
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

  updateUser(accountId: number): void {
    this.loading = true;
    this.accountByID();

    const bodyData = {
      firstname: this.firstname,
      middlename: this.middlename,
      lastname: this.lastname,
      email: this.email,
      contact: this.contact,
      role: this.role
    };

    this.serverService.updateUser(accountId, bodyData).subscribe(
      (resultData: any) => {
        this.loading = false;
        this.successMessage = resultData.message;
        this.fetchAccounts();
        setTimeout(() => this.successMessage = null, 2500);
      },
      (error) => {
        this.loading = false;
        this.errorMessage = error.error.message;
        setTimeout(() => this.errorMessage = null, 2500);
      }
    );
  }

  deleteUser(accountId: number): void {
    this.loading = true;
    const currentUserId = Number(sessionStorage.getItem('user_id'));

    if (accountId === currentUserId) {
      this.loading = false;
      this.errorMessage = "You cannot delete your own account!";
      setTimeout(() => this.errorMessage = null, 3500);
      return;
    }

    this.accountByID();
    const bodyData = {
      id: this.id,
      firstname: this.firstname,
      middlename: this.middlename,
      lastname: this.lastname,
      email: this.email,
      contact: this.contact,
      role: this.role
    };

    this.serverService.deleteUser(accountId, bodyData).subscribe(
      (resultData: any) => {
        this.loading = false;
        this.successMessage = resultData.message;
        this.fetchAccounts();
        setTimeout(() => this.successMessage = null, 2500);
      },
      (error) => {
        this.loading = false;
        this.errorMessage = error.error.message;
        setTimeout(() => this.errorMessage = null, 2500);
      }
    );
  }

  resetForm(): void {
    this.firstname = '';
    this.middlename = '';
    this.lastname = '';
    this.email = '';
    this.contact = '';
    this.password = '';
    this.confirm_password = '';
  }

  clearFormAndErrorMessage(): void {
    this.resetForm();
    this.errorMessage = null;
  }
}
