import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/datas/carrinho_produtos.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CarrinhoModel extends Model {
  UserModel usuario;

  List<CarrinhoProdutos> produtos = [];

  CarrinhoModel(this.usuario);

  static CarrinhoModel of(BuildContext context) =>
      ScopedModel.of<CarrinhoModel>(context);

  void addItemCarrinho(CarrinhoProdutos carrinhoProdutos) {
    produtos.add(carrinhoProdutos);

    Firestore.instance
        .collection("usuarios")
        .document(usuario.firebaseUsuario.uid)
        .collection("carrinho")
        .add(carrinhoProdutos.toMap())
        .then((doc) {
      carrinhoProdutos.carrinho_id = doc.documentID;
    });
    notifyListeners();
  }

  void removerItemCarrinho(CarrinhoProdutos carrinhoProdutos) {
    Firestore.instance
        .collection("usuarios")
        .document(usuario.firebaseUsuario.uid)
        .collection("carrinho")
        .document(carrinhoProdutos.carrinho_id)
        .delete();

    produtos.remove(carrinhoProdutos);
    notifyListeners();
  }
}
