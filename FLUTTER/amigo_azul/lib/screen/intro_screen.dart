import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onDone: () {
        print("hello");
      },
      done: Text(""),
      showNextButton: true,
      skip: Text("VOLTAR"),
      next: Text("PROX"),
      showSkipButton: true,
      nextFlex: 0,
      skipFlex: 0,
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(30.0, 10.0),
          activeColor: Colors.blue,
          color: Colors.black,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      pages: [
        PageViewModel(
          title: "APRENDER",
          decoration: decoracaoPagina(
              Color(
                  int.parse("#756858".substring(1, 7), radix: 16) + 0xFF000000),
              Colors.white,
              Colors.white,
              40,
              25),
          body:
              "Um jeito divertido para aprender sobre tudo com atividades lúdicas e desafiadoras!",
          image: Center(
            child: Image.asset(
              "assets/intro_aprender.jpg",
              width: MediaQuery.of(context).size.width - 10,
            ),
          ),
        ),
        PageViewModel(
          decoration: decoracaoPagina(
              Colors.green[100], Colors.black, Colors.black, 40, 25),
          title: "FALAR",
          body:
              "Uma ferramenta de comunicação para o auxilio em todos os momentos do seu dia!",
          image: Center(
            child: Image.asset(
              "assets/intro_falar.png",
              width: MediaQuery.of(context).size.width - 40,
            ),
          ),
        ),
        PageViewModel(
          title: " JUNTE-SE A NÓS",
          body:
              "Vamos ser Amigos? \n É rápido e fácil começarmos essa amizade!",
          image:  Center(child: Image.asset(
            "assets/intro_junte_se_a_nos.jpg",
            width: MediaQuery.of(context).size.width - 10,
          ),),
          decoration: decoracaoPagina(Color(
              int.parse("#0d8ea3".substring(1, 7), radix: 16) + 0xFF000000), Colors.white, Colors.white, 40, 25),
          footer: Container(
            //*******************************************botao entrar CELULAR
            width: MediaQuery.of(context).size.width / 1.6,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(25))),
                backgroundColor: Colors.blueAccent,
                shadowColor: Colors.black,
                elevation: 5,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/cadastrar_usuario');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                   Icons.accessibility_rounded,
                    size: 36,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Amigos?",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Regular",
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  decoracaoPagina(
    @required Color corFundoPagina,
    @required Color corTextoTitulo,
    @required Color corTextoBody,
    @required double tamFonteTitulo,
    @required double tamFonteBody,
  ) {
    return PageDecoration(
        pageColor: corFundoPagina,
        titleTextStyle: TextStyle(
            fontSize: tamFonteTitulo,
            fontWeight: FontWeight.bold,
            fontFamily: "Balsan",
            color: corTextoTitulo),
        bodyTextStyle: TextStyle(
            fontSize: tamFonteBody, fontFamily: "Balsan", color: corTextoBody));
  }
}
