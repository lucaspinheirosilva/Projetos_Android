import 'dart:io';

import 'package:chat_firebase/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  GoogleSignIn googleSingnIn = GoogleSignIn();
  FirebaseUser _usuarioAtual;
  GlobalKey<ScaffoldState> scaffoldKEY = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      _usuarioAtual = user;
    });
  }

  Future<FirebaseUser> _getUsuario() async {
    if (_usuarioAtual != null) return _usuarioAtual;
    try {
      GoogleSignInAccount googleSignInAccount = await googleSingnIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseUser user = authResult.user;

      return user;
    } catch (error) {
      return null;
    }
  }

  Future<void> _sendMenssagem({String texto, File imgFile}) async {
    FirebaseUser user = await _getUsuario();
    if (user == null) {
      scaffoldKEY.currentState.showSnackBar(SnackBar(
        content: Text('Não Foi possivel Fazer o Login. Tente Novamente!'),
        backgroundColor: Colors.red,
      ));
    }

    Map<String, dynamic> data = {
      "usuarioID":user.uid,
      "usuarioNome":user.displayName,
      "usuarioFotoUrl":user.photoUrl,
    };

    if (imgFile != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }
    if (texto != null) data['texto'] = texto;
    Firestore.instance.collection('MENSAGENS').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKEY,
        appBar: AppBar(
          title: Text("Titulo"),
          elevation: 0,
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('MENSAGENS').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> documentos =
                      snapshot.data.documents.reversed.toList();

                  return ListView.builder(
                      itemCount: documentos.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(documentos[index].data['texto']),
                        );
                      });
              }
            },
          )),
          TextComposer(_sendMenssagem)
        ]));
  }
}
