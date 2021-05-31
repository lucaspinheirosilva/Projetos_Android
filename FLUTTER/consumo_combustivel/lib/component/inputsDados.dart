import 'package:flutter/material.dart';




  Widget InputDados(
      @required BuildContext context  ,
      @required String hintErro,
      @required TextEditingController controller,
      @required String hint,
      @required String icone,
      @required  String sulfix,
      @required Color corFundo,
      @required Color corSulfix,
      @required double divisaoTela) {
    return Container(
      width: MediaQuery.of(context).size.width/divisaoTela,
      padding: EdgeInsets.all(10),
      child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,

          decoration: InputDecoration(
            errorText: hintErro,
            labelText: hint,
            labelStyle: TextStyle(color: Colors.white, fontSize: 16),
            filled: true,
            fillColor: corFundo,
            prefixIcon: Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                icone,
                width: 3,
                height: 3,
              ),
            ),
            isDense: true,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white)),
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            suffixText: sulfix,
            suffixStyle: new TextStyle(
              color: corSulfix,
              fontSize: 15,
            ),
          )),
    );
  }


