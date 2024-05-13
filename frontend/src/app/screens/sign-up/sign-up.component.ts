import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css',
})
export class SignUpComponent {
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
  constructor(private router: Router, private serverService: ServerService) {}

  signUp() {
    const userData = {
      firstname: this.firstname,
      middlename: this.middlename,
      lastname: this.lastname,
      email: this.email,
      contact: this.contact,
      role: this.role,
      status: this.status,
      password: this.password,
      confirm_password: this.confirm_password,
    };
    if (this.password !== this.confirm_password) {
      this.errorMessage = "Password didn't match! Please try again.";
      setTimeout(() => {
        this.errorMessage = null;
      }, 3500);
    } else {
      this.serverService.signUp(userData);
    }
  }

  goToPage(pageName: string): void {
    this.router.navigate([`${pageName}`]);
  }
}
