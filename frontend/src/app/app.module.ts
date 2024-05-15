import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SignUpComponent } from './screens/sign-up/sign-up.component';
import { SignInComponent } from './screens/sign-in/sign-in.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AdminComponent } from './screens/admin/admin.component';
import { CustomerComponent } from './screens/customer/customer.component';
import { JwtModule } from '@auth0/angular-jwt';
import { ServerService } from './services/server.service';
import { CookieService } from 'ngx-cookie-service';
import { CarlistComponent } from './screens/carlist/carlist.component';
import { DataTablesModule } from "angular-datatables";
import { SalesRentalComponent } from './screens/sales-rental/sales-rental.component';
import { UserManagementComponent } from './screens/user-management/user-management.component';
import { ReportsComponent } from './screens/reports/reports.component';
import { MaintenanceSchedulingComponent } from './screens/maintenance-scheduling/maintenance-scheduling.component';

@NgModule({
  declarations: [
    AppComponent,
    SignUpComponent,
    SignInComponent,
    AdminComponent,
    CustomerComponent,
    CarlistComponent,
    SalesRentalComponent,
    UserManagementComponent,
    ReportsComponent,
    MaintenanceSchedulingComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    DataTablesModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: () => localStorage.getItem('jwt_token'),
        allowedDomains: ['http://localhost:8000'], // Add the domain(s) where your API is hosted
        disallowedRoutes: [], // Add routes that should not include the JWT token
      },
    }),
  ],
  providers: [ ServerService,CookieService],
  bootstrap: [AppComponent]
})
export class AppModule { }
