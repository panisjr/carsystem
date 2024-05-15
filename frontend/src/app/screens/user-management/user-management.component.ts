import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject, subscribeOn } from 'rxjs';

@Component({
  selector: 'app-user-management',
  templateUrl: './user-management.component.html',
  styleUrl: './user-management.component.css'
})
export class UserManagementComponent implements OnInit {
   //User Credentials
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
  loading: boolean = false;
  userData: any = {};
  constructor(private serverService: ServerService, private token: TokenService, private router: Router) {}

  ngOnInit(): void {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10
    };
    this.getUsers();
    const data = this.token.get();
    this.userData = data.user;
  }

  getUsers(): void {
    this.serverService.getUsers().subscribe(
      (response: any) => {
        this.users = response;
        this.dtTrigger.next(null); // Trigger datatable refresh after data fetch
      },
      (error) => {
        console.error('Error fetching users:', error);
      }
    );
  }

  onFileSelected(event: any){
    if(event.target.files && event.target.files.length > 0){
      this.profileFile = event.target.files[0];
    }
  }
  signUp(){
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
    if(this.profileFile){
      formData.append('profileFile',this.profileFile);
    }
    this.serverService.signUp(formData).subscribe(
      (response: any) => {
        this.successMessage = response.message;
        setTimeout(() => {
          this.resetForm();
          this.successMessage = null;
        }, 3000);
      },
      (error) => {
        this.errorMessage = error.error.message;
        setTimeout(() => {
          this.errorMessage = null;
        }, 3500);
      }
    );
  }

  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
  resetForm() {
    this.firstname = '';
    this.middlename = '';
    this.lastname = '';
    this.email = '';
    this.contact = '';
    this.password = '';
    this.confirm_password = '';
    this.profileFile = null;
  }
}
