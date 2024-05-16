import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SignInComponent } from './screens/sign-in/sign-in.component';
import { SignUpComponent } from './screens/sign-up/sign-up.component';
import { AdminComponent } from './screens/admin/admin.component';
import { CustomerComponent } from './screens/customer/customer.component';
import { CarlistComponent } from './screens/carlist/carlist.component';
import { AuthGuard } from './auth.guard';
import { SalesRentalComponent } from './screens/sales-rental/sales-rental.component';
import { UserManagementComponent } from './screens/user-management/user-management.component';
import { ReportsComponent } from './screens/reports/reports.component';
import { MaintenanceSchedulingComponent } from './screens/maintenance-scheduling/maintenance-scheduling.component';

const routes: Routes = [
  { path: '', redirectTo: '/signIn', pathMatch: 'full' },
  { path: 'signIn', component: SignInComponent, title: 'Sign In' },
  { path: 'signUp', component: SignUpComponent, title: 'Sign Up on AutoGaurdian' },

  // Admin Routes
  { path: 'adminDashboard', component: AdminComponent, title:'AutoGaurdian | Dashboard',data: { expectedRole: 'Admin' }, canActivate: [AuthGuard]},
  { path: 'userManagement', component: UserManagementComponent, title: 'AutoGaurdian | User Management' ,data: { expectedRole: 'Admin' }, canActivate: [AuthGuard]},
  { path: 'carlist', component: CarlistComponent, title: 'AutoGaurdian | Car Management' , data: { expectedRole: 'Admin' }, canActivate: [AuthGuard]},
  { path: 'salesRental', component: SalesRentalComponent, title: 'AutoGaurdian | Sales and Rental Management',data: { expectedRole: 'Admin' }, canActivate: [AuthGuard] },
  { path: 'maintenance', component: MaintenanceSchedulingComponent, title: 'AutoGaurdian | Maintenance Scheduling', data: { expectedRole: 'Admin' }, canActivate: [AuthGuard] },
  { path: 'reports', component: ReportsComponent, title: 'AutoGaurdian | Reports' ,data: { expectedRole: 'Admin' }, canActivate: [AuthGuard]},

  // Customer Routes
  { path: 'customerDashboard', component: CustomerComponent, title:'AutoGaurdian | Dashboard',data: { expectedRole: 'Customer' }, canActivate: [AuthGuard] },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
