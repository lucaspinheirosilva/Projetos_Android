import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra de titulo
      appBar: AppBar(
        title: Text(product.titulo),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            //Carrousel com as imagens do firebase
            child: Carousel(
              images: product.imagens.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotColor: Colors.red,
              dotBgColor: Colors.transparent,
              autoplay: false,
              animationCurve: Curves.easeInOutCirc,
              dotSize: 7,
              dotSpacing: 30,
              dotIncreasedColor: Colors.red,
              showIndicator: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "${product.titulo}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "R\$ ${product.preco.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Tamanho",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: product.tamanhos.map(
                      (tamanho) {
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border:
                                  Border.all(color: Colors.grey, width: 50.00),
                            ),
                            width: 50.0,
                            alignment: Alignment.center,
                            child: Text(tamanho),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Text("Descrição"),
                Text(
                  product.descricao,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
