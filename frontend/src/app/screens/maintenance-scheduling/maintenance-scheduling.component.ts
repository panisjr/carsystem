import { Component, OnInit } from '@angular/core';
import { ServerService } from '../../services/server.service';
import { TokenService } from '../../services/token.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-maintenance-scheduling',
  templateUrl: './maintenance-scheduling.component.html',
  styleUrl: './maintenance-scheduling.component.css'
})
export class MaintenanceSchedulingComponent implements OnInit {
  dtoptions: any={};
  dtTrigger = new Subject<any>();
  errorMessage: string | null = null;
  successMessage: string | null = null;
  userData: any = {};
constructor(private serverService:ServerService, private token: TokenService, private router: Router){}
ngOnInit(): void {
    const data = this.token.get();
    this.userData = data.user;
}
logout(){
  this.token.remove();
  this.router.navigate(['/signIn']);
}
}
