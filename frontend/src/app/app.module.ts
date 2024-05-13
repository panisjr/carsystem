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
import { HomeComponent } from './screens/home/home.component';
import { JwtModule } from '@auth0/angular-jwt';
import { ServerService } from './services/server.service';
import { CarlistComponent } from './screens/carlist/carlist.component';

@NgModule({
  declarations: [
    AppComponent,
    SignUpComponent,
    SignInComponent,
    AdminComponent,
    CustomerComponent,
    HomeComponent,
    CarlistComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: () => localStorage.getItem('jwt_token'),
        allowedDomains: ['http://localhost:8000'], // Add the domain(s) where your API is hosted
        disallowedRoutes: [], // Add routes that should not include the JWT token
      },
    }),
  ],
  providers: [ServerService],
  bootstrap: [AppComponent]
})
export class AppModule { }
