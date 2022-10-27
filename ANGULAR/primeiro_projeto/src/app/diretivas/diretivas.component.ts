import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-diretivas',
  templateUrl: './diretivas.component.html',
  styleUrls: ['./diretivas.component.scss']
})
export class DiretivasComponent implements OnInit {

  //IF ELSE
  public condicao_1: boolean = false;
  public condicao_2: boolean = false;

  //FOR
  lista: Array<{ nome: String, idade: Number }> = [
    { nome: 'Lucas Pinheiro', idade: 29 },
    { nome: 'Elaine Bail', idade: 27 },
    { nome: 'Livia Bail', idade: 2 }];

  public nomeFor: String = "";

  constructor() { }

  ngOnInit(): void {

    //ID ELSE
    setInterval(() => {
      if (this.condicao_1) {
        this.condicao_1 = false;
      } else {
        this.condicao_1 = true;
      }
    }, 10000);
  }
  public condit_2() {
    if (this.condicao_2) {
      this.condicao_2 = false;
    }
    else {
      this.condicao_2 = true
    }
  }

  //FOR
  public returnFor(evento: any) {
    this.nomeFor = evento.target.value;
    if (this.nomeFor != "") {
      this.lista.push({ nome: this.nomeFor, idade: 5 });
      this.nomeFor=''
    } else {
      alert("Digite algo para Adicionar")
    }


  }

}
