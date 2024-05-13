import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent {
  constructor(private router:Router, private token:TokenService){}
  logout(){
    this.token.remove();
  }
  goToPage(pageName:string):void{
      this.router.navigate([`${pageName}`])
  }
}
