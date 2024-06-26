import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrl: './reports.component.css',
})
export class ReportsComponent implements OnInit {
  reportData: any[] = [];
  dtoptions: any = {};
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  userData: any = {};
  constructor(private router: Router, private token: TokenService) {}
  ngOnInit(): void {
    const data = this.token.get();
    this.userData = data.user;
  }
  logout(){
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
}
