import 'package:flutter/material.dart';

Widget errorDesktop(BuildContext context, String error) {
  return Center(
      child: Container(
    width: MediaQuery.of(context).size.width / 1.8,
    height: MediaQuery.of(context).size.height / 1.7,
    child: Column(
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 200,
        ),
        Flexible(
            child: SingleChildScrollView(
              child: Text(
          error,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
            ))
      ],
    ),
  ));
}

Widget errorMobile(BuildContext context, String error) {
  return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 1.7,
        child: Column(
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 100,
            ),
            Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
          ],
        ),
      ));
}
