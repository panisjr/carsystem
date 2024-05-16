import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ServerService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) { }

  // Car list
  addCar(data: any) {
    const formData = new FormData();
    for (const key in data) {
      if (data.hasOwnProperty(key)) {
        formData.append(key, data[key]);
      }
    }
    return this.http.post(`${this.apiUrl}/cars`, formData);
  }

  getCars(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/cars`);
  }

  deleteCar(carId: number) {
    return this.http.delete(`${this.apiUrl}/cars/${carId}`);
  }

  updateCar(car: any) {
    const formData = new FormData();
    for (const key in car) {
      if (car.hasOwnProperty(key)) {
        formData.append(key, car[key]);
      }
    }
    return this.http.put(`${this.apiUrl}/cars/${car.id}`, formData);
  }

  // Customer sign up and sign in
  signUp(formData: FormData) {
    return this.http.post<any>(`${this.apiUrl}/signUp`, formData);
  }

  signIn(data: any) {
    return this.http.post(`${this.apiUrl}/signIn`, data);
  }

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

  // Displaying Data in Admin Dashboard
  getTotal(): Observable<any> {
    return this.http.get<{ totalAccounts: number, totalBooks: number }>(`${this.apiUrl}/getTotal`);
  }

  getTodayRegisteredUsersCount() {
    return this.http.get<{ count: number }>(
      `${this.apiUrl}/users/todayRegisteredUsersCount`
    );
  }

  getTodayRegisteredCarsCount() {
    return this.http.get<{ count: number }>(
      `${this.apiUrl}/users/todayRegisteredCarsCount`
    );
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

  // Sales and Revenue Reports
  getReportData(): Observable<any> {
    return this.http.get(`${this.apiUrl}/sales`);
  }

  buyCar(data: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/sales`, data);
  }
}
