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
  String tam;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

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
                  height: 35.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 0.8,
                        childAspectRatio: 0.6),
                    children: product.tamanhos.map(
                      (tamanho) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              tam = tamanho;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: tam == tamanho
                                      ? primaryColor
                                      : Colors.grey,
                                  width: 3),
                              color: tam == tamanho
                                  ? primaryColor
                                  : Colors.transparent,
                            ),
                            width: 30.0,
                            alignment: Alignment.center,
                            child: Text(tamanho,
                                style: TextStyle(
                                  color: tam == tamanho
                                      ? Colors.white
                                      : Colors.black,
                                )),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: tam != null ? () {} : null,
                    child: Text(
                      "Adicionar ao carrino",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Descrição",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(
                  product.descricao,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
