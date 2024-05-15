import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
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
  profileFile: File | null = null;

  constructor(private router: Router, private serverService: ServerService) {}

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

    if (this.password!== this.confirm_password) {
      this.errorMessage = "Password didn't match Please try again.";
      setTimeout(() => {
        this.errorMessage = null;
      }, 3500);
    } else {
      this.serverService.signUp(formData).subscribe(
        (response: any) => {
          this.successMessage = response.message;
          this.resetForm();
          this.router.navigate(['/signIn']);
        },
        (error) => {
          this.errorMessage = error.error.message;
          setTimeout(() => {
            this.errorMessage = null;
          }, 3500);
        }
      );
    }
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
