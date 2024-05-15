import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MaintenanceSchedulingComponent } from './maintenance-scheduling.component';

describe('MaintenanceSchedulingComponent', () => {
  let component: MaintenanceSchedulingComponent;
  let fixture: ComponentFixture<MaintenanceSchedulingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [MaintenanceSchedulingComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MaintenanceSchedulingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
