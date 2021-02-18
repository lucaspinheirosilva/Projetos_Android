import 'package:flutter/material.dart';

 class Usuario {

  @required  final String email;
  @required  final String senha;
  @required final String grauTea;
  @required  final String nome;
  @required final String idade;
  @required  final String foto;



   Usuario(this.email,this.senha,this.nome,this.foto,this.grauTea,this.idade);

}