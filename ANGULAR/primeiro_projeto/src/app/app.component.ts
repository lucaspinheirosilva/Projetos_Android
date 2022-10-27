import { Component } from '@angular/core';


@Component({
  selector: 'app-root',
  template: `
  <button mat-raised-button color="primary" routerLink="data_binding">Data Binding</button> &nbsp;
  <button mat-raised-button color="primary" routerLink="diretivas">Diretivas</button>&nbsp;

  <hr>

  <router-outlet></router-outlet>`
})
export class AppComponent {  
}
