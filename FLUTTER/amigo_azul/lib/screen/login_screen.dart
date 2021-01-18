import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 30.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                )
              ],
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  child: Image.asset("assets/img_logo.png"),
                ),
                Text(
                  "Amigo Azul",
                  style: TextStyle(
                      fontFamily: "Regular",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: <Widget>[
                TextFormField( ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
