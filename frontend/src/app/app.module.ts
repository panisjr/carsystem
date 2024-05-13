import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminComponent } from './screens/admin/admin.component';
import { CustomerComponent } from './screens/customer/customer.component';
import { HomeComponent } from './screens/home/home.component';
import { SignUpComponent } from './screens/sign-up/sign-up.component';
import { SignInComponent } from './screens/sign-in/sign-in.component';

@NgModule({
  declarations: [
    AppComponent,
    AdminComponent,
    CustomerComponent,
    HomeComponent,
    SignUpComponent,
    SignInComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
