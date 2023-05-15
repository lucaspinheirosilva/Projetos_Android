import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { BackgroundComponent } from './components/background/background.component';
import { TituloComponent } from './components/titulo/titulo.component';
import { InputAddCepComponent } from './components/input-add-cep/input-add-cep.component';
import { FiltroCepComponent } from './components/filtro-cep/filtro-cep.component';

@NgModule({
  declarations: [
    AppComponent,
    BackgroundComponent,
    TituloComponent,
    InputAddCepComponent,
    FiltroCepComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
