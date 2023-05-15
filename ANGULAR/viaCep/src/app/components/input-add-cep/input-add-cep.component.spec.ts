import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InputAddCepComponent } from './input-add-cep.component';

describe('InputAddCepComponent', () => {
  let component: InputAddCepComponent;
  let fixture: ComponentFixture<InputAddCepComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InputAddCepComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InputAddCepComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
