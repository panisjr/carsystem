import { Injectable } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  constructor(private cookieService: CookieService) {}

  get() {
    // Retrieve token and user data from cookies
    const token = this.cookieService.get('token');
    const user = JSON.parse(this.cookieService.get('user') || '{}');
    return { token, user };
  }

  remove() {
    // Remove token and user data from cookies
    this.cookieService.delete('token');
    this.cookieService.delete('user');
  }
}
