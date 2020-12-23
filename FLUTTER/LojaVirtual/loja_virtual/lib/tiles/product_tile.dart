import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/screen/products_screen.dart';

class ProductTile extends StatelessWidget {
  final ProductData product;
  final String type;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductScreen(product)));
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: type == "grid"
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.82,
                child: Image.network(
                  product.imagens[0],
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 3, 8, 5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        product.titulo,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "R\$ ${product.preco.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : Row(
            children: <Widget>[
              Flexible(
                flex:1,
                child: Image.network(
                    product.imagens[0],
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),

              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 3, 8, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.titulo,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "R\$ ${product.preco.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}
