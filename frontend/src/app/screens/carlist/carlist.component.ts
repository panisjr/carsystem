import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-carlist',
  templateUrl: './carlist.component.html',
  styleUrls: ['./carlist.component.css'],
})
export class CarlistComponent implements OnInit {
  carData = {
    id: 0,
    make: '',
    model: '',
    year: null,
    VIN: '',
    license_plate_number: '',
    price: null,
    color: '',
    fuel_type: '',
    transmission_type: '',
  };

  editCarData = {
    make: '',
    model: '',
    year: null,
    VIN: '',
    license_plate_number: '',
    price: null,
    color: '',
    fuel_type: '',
    transmission_type: '',
  };

  cars: any[] = [];
  dtoptions: any = {};
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;
  userData: any = {};
  editing: boolean = false;
  profilePictureUrl: string | null = null; 
  constructor(
    private serverService: ServerService,
    private token: TokenService,
    private router: Router, private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10,
    };

    this.fetchCars();
    const data = this.token.get();
    this.userData = data.user;
    if (this.userData.profileFile) {
      this.profilePictureUrl = `http://localhost:8000/storage/${this.userData.profileFile}`;
    }
  }

  fetchCars() {
    this.serverService.getCars().subscribe((data: any) => {
      this.cars = data;
      if(this.cars){
    this.dtTrigger.unsubscribe();
      }
      this.dtTrigger.next(null); // Trigger DataTables rendering
    });
  }

  addCar() {
    this.loading = true;
    this.serverService.addCar(this.carData).subscribe(
      (response: any) => {
        this.loading = false;
        this.toastr.success(response.message);
        this.fetchCars();
        setTimeout(() => {
          this.successMessage = null;
        }, 3500);

        this.carData = {
          id: 0,
          make: '',
          model: '',
          year: null,
          VIN: '',
          license_plate_number: '',
          price: null,
          color: '',
          fuel_type: '',
          transmission_type: '',
        };
        this.fetchCars();
      },
      (error) => {
        this.loading = false;
        this.toastr.error(error,'Error adding car!');
        this.toastr.error('An error occurred while adding the car.');
      }
    );
  }
  setEdit(carID: number) {
    this.editing = true;
    const car = this.cars.find((c) => c.id === carID);
    if (car) {
      this.carData = { ...car };
    }
  }
  updateCar(carID: number) {
    this.loading = true;
    console.log(this.carData)
    this.serverService.updateCar(this.carData).subscribe(
      (response: any) => {
        this.loading = false;
        this.toastr.success(response.message);
        this.fetchCars();
      },
      (error) => {
        this.loading = false;
        this.toastr.error( error,'Error updating car:');
          this.toastr.error('An error occurred while updating the car.');
      }
    );
  }

  deleteCar(car: any) {
    console.log(car)
      this.serverService.deleteCar(car).subscribe(
        (response: any) => {
          this.fetchCars();
          this.toastr.success(response.message);
        },
        (error) => {
          this.toastr.error( error,'Error deleting car:');
          this.toastr.error('An error occurred while deleting the car.');
        }
      );
  }

  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
  resetForm() {
    this.carData = {
      id: 0,
      make: '',
      model: '',
      year: null,
      VIN: '',
      license_plate_number: '',
      price: null,
      color: '',
      fuel_type: '',
      transmission_type: '',
    };
    this.editing = false;
  }
}
