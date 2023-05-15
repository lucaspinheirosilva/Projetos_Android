import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FiltroCepComponent } from './filtro-cep.component';

describe('FiltroCepComponent', () => {
  let component: FiltroCepComponent;
  let fixture: ComponentFixture<FiltroCepComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FiltroCepComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FiltroCepComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
