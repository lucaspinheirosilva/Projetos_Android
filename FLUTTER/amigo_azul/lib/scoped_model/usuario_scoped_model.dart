import 'package:amigo_azul/model/usuario.dart';
import 'package:scoped_model/scoped_model.dart';

/**https://soonsantos.medium.com/how-to-use-scopedmodel-in-flutter-f4178a728f99**/

class UsuarioModel extends Model {
  Usuario _usuarioAtual; //Armazena as informações do usuário.

//Este método pega a Usercomo argumento e o armazena em nossa _usuarioAtual variável privada.
  void login(Usuario usuario) {
    _usuarioAtual = usuario;
  }

  //Este é um método Getter and Setter que torna possível ler a variável privada do usuário atual.
  Usuario get usuarioAtual => _usuarioAtual;

  set usuarioAtual(Usuario value) {
    _usuarioAtual = value;
  }



}
