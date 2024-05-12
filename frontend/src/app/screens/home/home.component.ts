import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  constructor(private router:Router){}

  goToPage(pageName:string):void{
      this.router.navigate([`${pageName}`])
  }

  logout(){
    sessionStorage.removeItem('jwt_token');
    sessionStorage.removeItem('user_info');
    sessionStorage.removeItem('user_id');
    this.router.navigate(['/signIn']);
  }
}
