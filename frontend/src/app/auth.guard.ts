import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { TokenService } from './services/token.service';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(
    private router: Router,
    private cookieService: CookieService,
    private token: TokenService
  ) {}

  canActivate(): boolean {
    const token = this.cookieService.get('access_token');
    if (token === 'undefined') {
      console.log('Access token is undefined.');
        this.token.remove();
        this.router.navigate(['/signIn']);
      return false;
    } else {
      if (token) {
        return true; // Allow access to the route if the JWT token is present
      } else {
        this.router.navigate(['/signIn']);
        return false; // Deny access to the route if the user is not logged in
      }
    }
  }
}
