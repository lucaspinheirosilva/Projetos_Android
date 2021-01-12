import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CarrinhoProdutos {
  String carrinho_id;
  String categoria;
  String produto_id;
  int quantidade;
  String tamanho;
  ProductData productData;

  CarrinhoProdutos();

  CarrinhoProdutos.fromDocument(DocumentSnapshot documento) {
    carrinho_id = documento.documentID;
    categoria = documento.data["categoria"];
    produto_id = documento.data["produto_id"];
    quantidade = documento.data["quantidade"];
    tamanho = documento.data["tamanho"];
  }

  Map<String, dynamic> toMap() {
    return {
      "categoria": categoria,
      "produto_id": produto_id,
      "quantidade": quantidade,
      "tamanho": tamanho,
      //
      // "produto": productData.toResumeMap()
    };
  }
}
