import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-sales-rental',
  templateUrl: './sales-rental.component.html',
  styleUrl: './sales-rental.component.css',
})
export class SalesRentalComponent implements OnInit {
  sales: any[] = [];
  dtoptions: any = {};
  dtTrigger = new Subject<any>();

  errorMessage: string | null = null;
  successMessage: string | null = null;
  userData: any = {};
  constructor(
    private serverService: ServerService,
    private token: TokenService,
    private router: Router
  ) {}

  ngOnInit() {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10
    };
    this.serverService.getReportData()
    const data = this.token.get();
    this.userData = data.user;
  }
  
  logout() {
    this.token.remove();
    this.router.navigate(['/login']);
  }
}
