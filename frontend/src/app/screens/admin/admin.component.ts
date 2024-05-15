import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import 'datatables.net-dt';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent implements OnInit{
  accounts: any[] = [];
  userData: any = {};
  dataTable: any;
  constructor(private router:Router, private token:TokenService){}
  ngOnInit(): void {
   const data = this.token.get();
   this.userData = data.user;
  }
  logout(){
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
  goToPage(pageName:string):void{
      this.router.navigate([`${pageName}`])
  }
  
}
