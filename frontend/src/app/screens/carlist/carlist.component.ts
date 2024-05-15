import { Component, OnDestroy, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';

@Component({
  selector: 'app-carlist',
  templateUrl: './carlist.component.html',
  styleUrls: ['./carlist.component.css']
})
export class CarlistComponent implements OnInit, OnDestroy {
  carData = {
    make: '',
    model: '',
    year: null,
    VIN: '',
    license_plate_number: '',
    price: null,
    color: '',
    fuel_type: '',
    transmission_type: '',
    quantity: null,
  };

  editCarData = {
    id: null,
    make: '',
    model: '',
    year: null,
    VIN: '',
    license_plate_number: '',
    price: null,
    color: '',
    fuel_type: '',
    transmission_type: '',
    quantity: null,
  };

  cars: any[] = [];
  dtoptions: any = {};
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;

  constructor(private serverService: ServerService, private token: TokenService, private router: Router) { }

  ngOnInit(): void {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10
    };

    this.fetchCars();
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  fetchCars() {
    this.serverService.getCars().subscribe((data: any) => {
      this.cars = data;
      this.dtTrigger.next(null); // Trigger DataTables rendering
    });
  }

  addCar() {
    this.loading = true;
    this.serverService.addCar(this.carData).subscribe(
      (response: any) => {
        this.loading = false;
        this.successMessage = 'Car added successfully.';
        this.fetchCars();
        setTimeout(() => {
          this.successMessage = null;
        }, 3500);

        this.carData = {
          make: '',
          model: '',
          year: null,
          VIN: '',
          license_plate_number: '',
          price: null,
          color: '',
          fuel_type: '',
          transmission_type: '',
          quantity: null,
        };
      },
      (error) => {
        this.loading = false;
        this.errorMessage = error.error.message || 'An error occurred while adding the car.';
        setTimeout(() => {
          this.errorMessage = null;
        }, 3500);
      }
    );
  }

  openEditModal(car: any) {
    this.editCarData = { ...car };
  }

  updateCar() {
    this.loading = true;
    this.serverService.updateCar(this.editCarData).subscribe(
      (response: any) => {
        this.loading = false;
        this.successMessage = 'Car updated successfully.';
        this.fetchCars();
        setTimeout(() => {
          this.successMessage = null;
        }, 3500);
      },
      (error) => {
        this.loading = false;
        this.errorMessage = error.error.message || 'An error occurred while updating the car.';
        setTimeout(() => {
          this.errorMessage = null;
        }, 3500);
      }
    );
  }

  deleteCar(car: any) {
    if (confirm("Are you sure you want to delete this car?")) {
      this.serverService.deleteCar(car.id).subscribe(
        (response: any) => {
          this.fetchCars();
          this.successMessage = 'Car deleted successfully.';
          setTimeout(() => {
            this.successMessage = null;
          }, 3500);
        },
        (error) => {
          console.error('Error deleting car:', error);
          this.errorMessage = error.message || 'An error occurred while deleting the car.';
          setTimeout(() => {
            this.errorMessage = null;
          }, 3500);
        }
      );
    }
  }

  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
}
