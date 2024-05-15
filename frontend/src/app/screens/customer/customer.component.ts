import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {
  errorMessage: string | null = null;
  successMessage: string | null = null;
  userData: any = {};
 constructor(private router: Router, private token: TokenService){}
ngOnInit(): void {
    const data = this.token.get();
    this.userData = data.user;
}
logout(){
  this.token.remove();
  this.router.navigate(['/signIn'])
}
}
