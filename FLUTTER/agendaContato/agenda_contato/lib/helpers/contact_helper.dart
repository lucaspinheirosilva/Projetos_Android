final String idColuna = "idColuna";
final String nomeColuna = "nomeColuna";
final String emailColuna = "emailColuna";
final String foneColuna = "foneColuna";
final String imgColuna = "imgColuna";

class ContactHelper {}

class Contact {
  int id;
  String nome;
  String email;
  String fone;
  String img;

  Contact.fromMap(Map map) {
    id = map[idColuna];
    nome = map[nomeColuna];
    email = map[emailColuna];
    fone = map[foneColuna];
    img = map[imgColuna];
  }
  Map toMap(){
    Map<String,dynamic> map = {
      nomeColuna : nome,
      emailColuna : email,
      foneColuna : fone,
      imgColuna : img
    };
    if(id !=null){
      map[idColuna]=id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contato(ID: $id, NOME: $nome, EMAIL: $email,FONE: $fone,IMG: $img)";
  }

}
