import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  constructor() {}
  handle(token: any, user: any) {
    return this.set(token, user);
  }
  set(token: any, user: any) {
    sessionStorage.setItem('token', token);
    sessionStorage.setItem('user', JSON.stringify(user));
  }
  get() {
    const token = sessionStorage.getItem('token');
    const user = sessionStorage.getItem('user');
    return { user };
  }
  remove() {
    sessionStorage.removeItem('token');
    sessionStorage.removeItem('user');
  }
}
