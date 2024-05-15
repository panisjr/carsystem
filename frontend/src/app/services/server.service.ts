import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ServerService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) { }

  //carlist
  addCar(data: any) {
    return this.http.post(`${this.apiUrl}/cars`, data);
  }

  getCars() {
    return this.http.get(`${this.apiUrl}/cars`);
  }

  deleteCar(carId: number) {
    return this.http.delete(`${this.apiUrl}/cars/${carId}`);
  }

  updateCar(car: any) {
    return this.http.put(`${this.apiUrl}/cars/${car.id}`, car);
  }

  // Customer

  signUp(formData: FormData) {
    return this.http.post<any>(`${this.apiUrl}/signUp`, formData);  
  }
  signIn(data: any) {
    return this.http.post(`${this.apiUrl}/signIn`, data);
  }
  // End Sign In and Sign Up

  // CRUD User Management
  getUsers() {
    return this.http.get(`${this.apiUrl}/getUsers`);
  }
  updateUser(userId: number, data: any) {
    return this.http.put(`${this.apiUrl}/updateUser/${userId}`, data);
  }
  deleteUser(userId: number) {
    return this.http.delete(`${this.apiUrl}/deleteUser/${userId}`);
  }
  deactivate(userId: number, data: any) {
    return this.http.post(`${this.apiUrl}/deactivate/${userId}`, data);
  }
  getTotalAccounts(): Observable<any> {
    return this.http.get<{ totalAccounts: number; totalBooks: number }>(
      `${this.apiUrl}/getTotalAccounts`
    );
  }
  getTodayRegisteredUsersCount() {
    return this.http.get<{ count: number }>(
      `${this.apiUrl}/users/todayRegisteredUsersCount`
    );
  }
  // End CRUD User Management 

  // History
  history(
    actionType: string,
    userId: number,
    accountID: number,
    accountFirst: string,
    accountLast: string,
    accountRole: string
  ): Observable<any> {
    const payload = {
      action: actionType,
      user_id: userId,
      accountID: accountID,
      accountFirst: accountFirst,
      accountLast: accountLast,
      accountRole: accountRole,
    };
    console.log(payload);
    return this.http.post<any>(`${this.apiUrl}/history`, payload);
  }
  getHistory(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/getHistory`);
  }
  deleteHistory(historyID: number) {
    return this.http.delete(`${this.apiUrl}/deleteHistory/${historyID}`);
  }
  deleteAllHistory(): Observable<any> {
    return this.http.delete(`${this.apiUrl}/deleteAllHistory`);
  }

  // Sales and Revue Reports
  getReportData(): Observable<any> {
    // Replace with your actual API endpoint
    return this.http.get(`${this.apiUrl}/sales`);
  }
}
