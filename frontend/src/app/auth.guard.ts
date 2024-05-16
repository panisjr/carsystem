import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { TokenService } from './services/token.service';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  userData: any = {};
  constructor(
    private router: Router,
    private cookieService: CookieService,
    private token: TokenService
  ) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): boolean {
    const token = this.cookieService.get('access_token');
    const data = this.token.get();
    this.userData = data.user;
    if (!token || !data || !this.userData.role) {
      // Redirect to sign-in if token, user data, or role is missing
      this.router.navigate(['/signIn']);
      return false;
    }

    // Check the user's role and redirect accordingly
    if (route.data['expectedRole'] === 'Admin' && this.userData.role !== 'Admin') {
      console.log(route.data['expectedRole'] );
      // Redirect to customer dashboard if trying to access admin route
      this.router.navigate(['/customerDashboard']);
      return false;
    } else if (route.data['expectedRole'] === 'Customer' && this.userData.role !== 'Customer') {
      console.log(route.data['expectedRole'] );

      // Redirect to admin dashboard if trying to access customer route
      this.router.navigate(['/adminDashboard']);
      return false;
    }

    return true;
  }
}
