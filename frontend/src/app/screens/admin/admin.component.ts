import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent {
  constructor(private router:Router){}
  logout(){
    sessionStorage.removeItem('token');
    sessionStorage.removeItem('user');
    this.router.navigate(['/signIn']);
  }
  goToPage(pageName:string):void{
      this.router.navigate([`${pageName}`])
  }
}
