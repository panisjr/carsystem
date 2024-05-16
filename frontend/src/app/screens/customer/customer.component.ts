import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {
  errorMessage: string | null = null;
  successMessage: string | null = null;
  userData: any = {};
  cars: any[] = [];
  filteredCars: any[] = [];
  searchQuery: string = '';
  selectedTransmission: string | null = null; // Selected transmission type
  selectedFuelType: string | null = null; // Selected fuel type

  selectedCar: any = null; // Selected car for modal
  showModal: boolean = false; // Control modal visibility

  constructor(private router: Router, private token: TokenService, private serverService: ServerService, private toastr: ToastrService) { }

  ngOnInit(): void {
    const data = this.token.get();
    this.userData = data.user;

    this.fetchCars();
  }

  fetchCars(): void {
    this.serverService.getCars().subscribe(
      (cars: any[]) => {
        this.cars = cars;
        this.filteredCars = cars;
      },
      (error) => {
        this.errorMessage = "Failed to load cars.";
      }
    );
  }

  logout(): void {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }

  filterCars(): void {
    const query = this.searchQuery.toLowerCase();
    this.filteredCars = this.cars.filter(car =>
      (car.make.toLowerCase().includes(query) ||
        car.model.toLowerCase().includes(query) ||
        car.year.toString().includes(query) ||
        car.price.toString().includes(query)) &&
      (!this.selectedTransmission || car.transmission_type === this.selectedTransmission) &&
      (!this.selectedFuelType || car.fuel_type === this.selectedFuelType)
    );
  }

  openModal(car: any): void {
    this.selectedCar = car;
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
    this.selectedCar = null;
  }

  clearFilters(): void {
    this.selectedTransmission = null;
    this.selectedFuelType = null;
    this.filterCars();
  }
  //temporary to hide error
  buyCar(car: any) {
    const saleData = {
      car_name: `${car.make} ${car.model}`,
      customer_name: `${this.userData.firstname} ${this.userData.lastname}`,
      status: 'Bought',
      bought_at: new Date()
    };

    this.serverService.buyCar(saleData).subscribe(
      (response: any) => {
        this.toastr.success(response.message);
        this.fetchCars();
      },
      (error) => {
        this.toastr.error(error.error.message, 'Error buying car!');
      }
    );
  }

  rentCar(car: any) {

  }
}
