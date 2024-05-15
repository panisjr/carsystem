import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-user-management',
  templateUrl: './user-management.component.html',
  styleUrl: './user-management.component.css'
})
export class UserManagementComponent implements OnInit {
  user = {
    firstname: '',
    middlename: '',
    lastname: '',
    email: '',
    contact: '',
    password: '',
    confirm_password: '',
    status: null,
    role: 'Customer',
  };
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

  addUser() {
    this.loading = true;
    this.serverService.addCar(this.user).subscribe(
      (response: any) => {
        this.loading = false;
        this.successMessage = 'Car added successfully.';
        setTimeout(() => {
          this.successMessage = null;
        }, 3500);

        this.user = {
          firstname: '',
          middlename: '',
          lastname: '',
          email: '',
          contact: '',
          password: '',
          confirm_password: '',
          status: null,
          role: 'Customer',
        };
      },
      (error) => {
        this.loading = false;
        this.errorMessage =
          error.error.message || 'An error occurred while adding the car.';
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
}
