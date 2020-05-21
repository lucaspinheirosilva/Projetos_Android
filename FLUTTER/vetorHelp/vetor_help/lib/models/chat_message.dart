///https://medium.com/flutter-comunidade-br/criando-um-chatbot-com-flutter-e-dialogflow-f828e5301101
/*servirá como modelo para persistência das mensagens.
Adicionaremos também um enum para identificar se a mensagem
 foi enviada (sent) ou recebida (received).*/

enum ChatMessageType { sent, received }

class ChatMessage {
  final String name;
  final String text;
  final ChatMessageType type;

  ChatMessage({
    this.name,
    this.text,
    this.type = ChatMessageType.sent,
  });
}