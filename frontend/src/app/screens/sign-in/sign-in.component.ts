import { Component } from '@angular/core';
import {Router } from '@angular/router';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrl: './sign-in.component.css'
})
export class SignInComponent {

  firstname: string = '';
  middlename: string = '';
  lastname: string = '';
  email: string = '';
  contact: string = '';
  role: string = 'Customer';
  status: boolean = true;
  password: string = '';
  confirm_password: string = '';
  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;
constructor (private router:Router, private serverService: ServerService, private token: TokenService){}

signIn() {
  let userData = {
    email: this.email, 
    password: this.password, 
  };
  this.loading = true;
  this.serverService.signIn(userData).subscribe(
    (response: any) => {
      if (response) {
      this.token.handle(response.access_token);
      const role = response.user.role;
        this.loading = false;
        switch (role) {
          case 'Admin':
            this.router.navigate(['/adminDashboard']);
            break;
          case 'Customer':
            this.router.navigate(['/customerDashboard']);
            break;
          default:
            this.router.navigate(['/']);
            break;
        }
      } else {
        this.loading = false;
        this.errorMessage = 'Please make sure you already have an account.';
        setTimeout(() => {
          this.errorMessage = null;
        }, 3500);
      }
    },
    (error) => {
      this.loading = false;
     this.errorMessage = error.error.error;
     setTimeout(() => {
      this.errorMessage = null;
     }, 3500);
    }
  );
}    
goToPage(pageName:string):void{
  this.router.navigate([`${pageName}`])
}
}
