import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextPersonalizado extends StatelessWidget {
  TextEditingController tecTexto;
  String label;
  String prefix;
  Function funcao;

  InputTextPersonalizado(
      {Key? key,
      required this.tecTexto,
      required this.label,
      required this.prefix,
      required this.funcao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(1, 1), // changes position of shadow
              )
            ]),
        child: TextField(
          onChanged: (tx) {
            funcao(tx);
          },
          maxLength: 12,
          controller: tecTexto,
          style: const TextStyle(color: Colors.amber, fontSize: 20),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counter: const Offstage(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              fillColor: const Color(0xff0c0c0c),
              filled: true,
              label: Text(label,
                  style: const TextStyle(color: Colors.amber, fontSize: 25)),
              prefix: Padding(
                padding:const EdgeInsets.only(right: 10),
                child: Text(prefix),
              ),
              prefixStyle: const TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
              border: OutlineInputBorder()),
        ),
      ),
    );
  }

}
