import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  constructor(private cookieService: CookieService, private router: Router) {}

  handle(token: any,user:any) {
    return this.set(token, user);
  }

  set(token: any, user: any) {
    // Set token and user data in cookies
    this.cookieService.set('access_token', JSON.stringify(token));
    this.cookieService.set('user', JSON.stringify(user));
  }

  get() {
    // Retrieve token and user data from cookies
    const token = this.cookieService.get('access_token');
    const user = JSON.parse(this.cookieService.get('user'));
    return { token,user };
  }

  remove() {
    // Remove token and user data from cookies
    this.cookieService.delete('access_token');
    this.cookieService.delete('user');
  }
}
