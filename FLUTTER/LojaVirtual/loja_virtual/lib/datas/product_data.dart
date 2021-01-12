import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String id;

  String categoria;

  String titulo;
  String descricao;
  double preco;

  List imagens;
  List tamanhos;

  ProductData.fromDocument(DocumentSnapshot snapshot) {

    id = snapshot.documentID;
    titulo = snapshot.data["title"];
    descricao = snapshot.data["description"];
    preco = snapshot.data["price"] + 0.0;
    imagens = snapshot.data["image"];
    tamanhos = snapshot.data["sizes"];
  }
  Map<String,dynamic>toResumeMap(){
    return {
      "title": titulo,
      "description": descricao,
      "price": preco,
    };
  }
}
