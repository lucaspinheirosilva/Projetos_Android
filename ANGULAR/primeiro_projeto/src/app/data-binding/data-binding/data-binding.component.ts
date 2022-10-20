import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-data-binding',
  templateUrl: './data-binding.component.html',
  styleUrls: ['./data-binding.component.scss']
})
export class DataBindingComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  public nome:string = 'Lucas';
  public desabilitarBotao:boolean =true;

  public alertInfo(texto:string){
    alert(texto);
  }

}
