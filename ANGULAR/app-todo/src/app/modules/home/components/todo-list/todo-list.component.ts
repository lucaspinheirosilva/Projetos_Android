import { Component, OnInit } from '@angular/core';
import { MatIconRegistry } from "@angular/material/icon";
import { DomSanitizer } from "@angular/platform-browser";

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.scss']
})
export class TodoListComponent implements OnInit {

  constructor(
    private matIconRegistry: MatIconRegistry,
    private domSanitizer: DomSanitizer) {
    
    this.matIconRegistry.addSvgIcon(
      "lixeira",
      this.domSanitizer.bypassSecurityTrustResourceUrl("../../../../../assets/icons/icon_trash.svg")
    );
   }

  ngOnInit(): void {
  }

}
