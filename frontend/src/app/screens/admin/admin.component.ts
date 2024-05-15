import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import 'datatables.net-dt';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent implements OnInit{
  accounts: any[] = [];
  userData: any = {};
  dataTable: any;
  errorMessage: string | null = null;
  successMessage: string | null = null;
  // Today's Registered Accounts
  todayRegisteredUsersCount: number = 0;
  todayRegisteredCarsCount: number = 0;
  constructor(private router:Router, private token:TokenService, private serverService: ServerService){}
  ngOnInit(): void {
   const data = this.token.get();
   this.userData = data.user;
   this.serverService.getTodayRegisteredUsersCount().subscribe((response) => {
    this.todayRegisteredUsersCount = response.count;
  });
   this.serverService.getTodayRegisteredCarsCount().subscribe((response) => {
    this.todayRegisteredCarsCount = response.count;
  });
  }
  logout(){
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
}
