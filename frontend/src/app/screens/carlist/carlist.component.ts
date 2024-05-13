import { Component } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-carlist',
  templateUrl: './carlist.component.html',
  styleUrls: ['./carlist.component.css'], // Use 'styleUrls' instead of 'styleUrl'
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
    quantity: null,
  };

  cars: any[] = [];
  dtoptions: any = {}; // Add this for datatable options
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  loading: boolean = false;

  constructor(private serverService: ServerService, private token: TokenService, private router: Router) {}

  ngOnInit(): void {
    this.dtoptions = {
      pagingType: 'full_numbers',
      pageLength: 10
    };
    this.getCars();
  }

  getCars(): void {
    this.serverService.getCars().subscribe(
      (response: any) => {
        this.cars = response;
        this.dtTrigger.next(null); // Trigger datatable refresh after data fetch
      },
      (error) => {
        console.error('Error fetching cars:', error);
      }
    );
  }

  addCar() {
    this.loading = true;
    this.serverService.addCar(this.carData).subscribe(
      (response: any) => {
        this.loading = false;
        this.successMessage = 'Car added successfully.';
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
        this.errorMessage =
          error.error.message || 'An error occurred while adding the car.';
        setTimeout(() => {
          this.errorMessage = null;
        }, 3500);
      }
    );
  }

  logout() {
    this.token.remove();
    this.router.navigate(['/signIn']);
  }
}
