import { Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import 'datatables.net-dt';
import { ServerService } from '../../services/server.service';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrl: './customer.component.css'
})
export class CustomerComponent {
 constructor(){}
}
