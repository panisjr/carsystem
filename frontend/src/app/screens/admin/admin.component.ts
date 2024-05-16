import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import 'datatables.net-dt';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css',
})
export class AdminComponent implements OnInit {
  accounts: any[] = [];
  userData: any = {};
  dataTable: any;
  errorMessage: string | null = null;
  successMessage: string | null = null;
  // Today's Registered Accounts
  todayRegisteredUsersCount: number = 0;
  todayRegisteredCarsCount: number = 0;
  totalUsers: number = 0;
  totalCars: number = 0;
  profilePictureUrl: string | null = null; 
  constructor(
    private router: Router,
    private token: TokenService,
    private serverService: ServerService
  ) {}
  ngOnInit(): void {
    const data = this.token.get();
    this.userData = data.user;
    console.log(this.userData.profileFile)
    this.serverService.getTodayRegisteredUsersCount().subscribe((response) => {
      this.todayRegisteredUsersCount = response.count;
    });
    this.serverService.getTodayRegisteredCarsCount().subscribe((response) => {
      this.todayRegisteredCarsCount = response.count;
    });
    this.serverService.getTotal().subscribe((response: any) => {
      this.totalUsers = response.totalUsers;
      this.totalCars = response.totalCars;
    });
    if (this.userData.profileFile) {
      this.profilePictureUrl = `http://localhost:8000/storage/${this.userData.profileFile}`;
    }
  }
  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
}
