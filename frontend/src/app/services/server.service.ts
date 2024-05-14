import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ServerService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) {}

  //carlist
  addCar(data: any) {
    return this.http.post(`${this.apiUrl}/cars`, data);
  }

  // Customer

  signUp(data: any) {
    return this.http.post(`${this.apiUrl}/signUp`, data);
  }
  get() {
    return this.http.get(`${this.apiUrl}/getUsers`);
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
  getTodayRegisteredBooksCount() {
    return this.http.get<{ count: number }>(
      `${this.apiUrl}/users/todayRegisteredBooksCount`
    );
  }
  signIn(data: any) {
    return this.http.post(`${this.apiUrl}/signIn`, data);
  }

  updateUser(userId: number, data: any) {
    return this.http.put(`${this.apiUrl}/updateUser/${userId}`, data);
  }
  deleteUser(userId: number, data: any) {
    return this.http.delete(`${this.apiUrl}/deleteUser/${userId}`, data);
  }
  deactivate(userId: number, data: any) {
    return this.http.post(`${this.apiUrl}/deactivate/${userId}`, data);
  }
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
  getCars() {
    return this.http.get(`${this.apiUrl}/cars`);
  }

  
}
