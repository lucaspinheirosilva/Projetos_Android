import 'package:conversor_moedas/pages/conversor_Desktop.dart';
import 'package:flutter/material.dart';

import '../pages/conversor_Mobile.dart';

class barAppDesktop extends StatelessWidget {
  Function() ontapReset;

  barAppDesktop({Key? key, required this.ontapReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff282828),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: [
              const Expanded(
                flex: 15,
                child: Text("\$ Conversor \$",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: ontapReset,
                  icon: const Icon(
                    Icons.refresh_outlined,
                    size: 45,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          elevation: 7,
          shadowColor: Colors.white,
        ),body: Conversor_Desktop(),
      );
  }
}

class barAppMobile extends StatelessWidget {
  Function() ontapReset;

  barAppMobile({Key? key, required this.ontapReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282828),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("\$ Conversor MOBILE \$",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: ontapReset,
            icon: const Icon(
              Icons.refresh_outlined,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(00),
          ),
        ),
        elevation: 7,
        shadowColor: Colors.white,
      ),
      body: const Conversor_Mobile(),
    );
  }
}
