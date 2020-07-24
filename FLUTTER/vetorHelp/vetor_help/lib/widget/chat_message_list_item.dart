///https://medium.com/flutter-comunidade-br/criando-um-chatbot-com-flutter-e-dialogflow-f828e5301101
/*será um StatelessWidget para exibir a mensagem do usuário que esta enviando
 (mensagem a direita) e das mensagens recebidas (mensagem a esqueda).*/

import 'package:vetorhelp/models/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;


  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context);
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage(context);
  }

  //AVATAR do Tecnico
  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return Padding(
      padding: EdgeInsets.only(top: 10,bottom: 10),
        child: Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(new Radius.circular(20.0)),
                color: Colors.green[200]),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
              trailing: CircleAvatar(
                child: Text(chatMessage.name.toUpperCase()[0],
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.blueAccent,
              ),
              title: Text(
                chatMessage.name,
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
            )));
  }

  //AVATAR da VE.I.A
  Widget _showReceivedMessage(BuildContext context) {
    MediaQueryData tamanhoComprimento;
    tamanhoComprimento = MediaQuery.of(context);
    return Container(

      width: tamanhoComprimento.size.width / 2,


        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(new Radius.circular(20.0)),
            color: Colors.lightBlueAccent[100]),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage('logoVetor.png'),
          ),
          title: Text(
            chatMessage.name,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(chatMessage.text, textAlign: TextAlign.left),
        ));
  }  
}
