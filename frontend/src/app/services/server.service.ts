import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ServerService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) { }

  signUp(data: any) {
    return this.http.post(`${this.apiUrl}/signUp`, data);
  }

  signIn(data: any) {
    return this.http.post(`${this.apiUrl}/signIn`, data);
  }

  addCar(data: any) {
    return this.http.post(`${this.apiUrl}/cars`, data);
  }
}
