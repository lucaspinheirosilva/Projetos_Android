import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

//Components
import { HeaderComponent } from './components/header/header.component';
import { TodoButtonDeleteAllComponent } from './components/todo-button-delete-all/todo-button-delete-all.component';
import { TodoImputAddItensComponent } from './components/todo-imput-add-itens/todo-imput-add-itens.component';
import { TodoListComponent } from './components/todo-list/todo-list.component';
import { HttpClientModule } from "@angular/common/http";

//Pages
import { HomeComponent } from './pages/home/home.component';


//Material
import {MatButtonModule} from '@angular/material/button';
import {MatIconModule} from '@angular/material/icon';




@NgModule({
  declarations: [
    HeaderComponent,
    TodoButtonDeleteAllComponent,
    TodoImputAddItensComponent,
    TodoListComponent,
    HomeComponent,
    
  ],
  imports: [
    CommonModule,
    MatButtonModule,
    MatIconModule,
    HttpClientModule
  ]
})
export class HomeModule { }
