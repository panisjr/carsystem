import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrl: './sign-in.component.css',
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
  constructor(
    private router: Router,
    private serverService: ServerService,
    private token: TokenService,
    private toastr: ToastrService
  ) {}

  signIn() {
    let userData = {
      email: this.email,
      password: this.password,
    };
    this.loading = true;
    this.serverService.signIn(userData).subscribe(
      (response: any) => {
        this.token.handle(response.access_token, response.user);
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
      },
      (error) => {
        this.loading = false;
        this.toastr.error(error.error.message);
      }
    );
  }
}
