import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String contactTable = "contactTable";
final String idColuna = "idColuna";
final String nomeColuna = "nomeColuna";
final String emailColuna = "emailColuna";
final String foneColuna = "foneColuna";
final String imgColuna = "imgColuna";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, "contacts.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColuna INTEGER PRIMARY KEY, $nomeColuna TEXT, $emailColuna TEXT,$foneColuna TEXT,$imgColuna TEXT)");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  Future<Contact> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(contactTable,
        columns: [idColuna, nomeColuna, emailColuna, foneColuna, imgColuna],
        where: "$idColuna = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }
}

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

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColuna: nome,
      emailColuna: email,
      foneColuna: fone,
      imgColuna: img
    };
    if (id != null) {
      map[idColuna] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contato(ID: $id, NOME: $nome, EMAIL: $email,FONE: $fone,IMG: $img)";
  }
}
