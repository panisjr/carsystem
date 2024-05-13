import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SignInComponent } from './screens/sign-in/sign-in.component';
import { HomeComponent } from './screens/home/home.component';
import { SignUpComponent } from './screens/sign-up/sign-up.component';
import { AdminComponent } from './screens/admin/admin.component';
import { CustomerComponent } from './screens/customer/customer.component';
import { CarlistComponent } from './screens/carlist/carlist.component';
import { AuthGuard } from './auth.guard';

const routes: Routes = [
  { path: '', redirectTo: '/signIn', pathMatch: 'full' },
  { path: 'signIn', component: SignInComponent, title: 'Sign In' },
  { path: 'customerDashboard', component: HomeComponent, title: 'Home', canActivate:[AuthGuard] },
  { path: 'signUp', component: SignUpComponent, title: 'Sign Up' },
  { path: 'adminDashboard', component: AdminComponent, title: 'Admin Dashboard', canActivate:[AuthGuard]},
  { path: 'costumerManagement', component: CustomerComponent, title: 'Costumer Management' },
  { path: 'carlist', component: CarlistComponent, title: 'Car Management' },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
