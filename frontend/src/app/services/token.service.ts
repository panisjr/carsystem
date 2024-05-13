import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  constructor(private cookieService: CookieService, private router: Router) {}

  handle(token: any) {
    return this.set(token);
  }

  set(token: any) {
    // Set token and user data in cookies
    this.cookieService.set('access_token', JSON.stringify(token));
  }

  get() {
    // Retrieve token and user data from cookies
    const token = this.cookieService.get('access_token');
    return { token };
  }

  remove() {
    // Remove token and user data from cookies
    this.cookieService.delete('access_token');
  }
}
