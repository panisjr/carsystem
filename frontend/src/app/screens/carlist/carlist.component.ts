import { Component } from '@angular/core';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-carlist',
  templateUrl: './carlist.component.html',
  styleUrls: ['./carlist.component.css'] // Use 'styleUrls' instead of 'styleUrl'
})
export class CarlistComponent {

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
    quantity: null
  };

  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;

  constructor(private serverService: ServerService) { }

  addCar() {
    this.loading = true;
    this.serverService.addCar(this.carData).subscribe(
      (response: any) => {
        this.loading = false;
        this.successMessage = 'Car added successfully.';
        setTimeout(() => {
          this.successMessage = null;
        }, 3500);
        // Clear form data after successful addition
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
          quantity: null
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

}
