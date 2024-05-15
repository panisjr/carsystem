import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SalesRentalComponent } from './sales-rental.component';

describe('SalesRentalComponent', () => {
  let component: SalesRentalComponent;
  let fixture: ComponentFixture<SalesRentalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [SalesRentalComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SalesRentalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
