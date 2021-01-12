import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUsuario;
  Map<String, dynamic> usuarioData = Map();

  bool estaCarregando = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void cadastrar({@required Map<String, dynamic> userData, @required String pass,
    @required VoidCallback onSuccess, @required VoidCallback onFail}){

    estaCarregando = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((usuario) async {
      firebaseUsuario = usuario;

      await _saveUserData(userData);

      onSuccess();
      estaCarregando = false;
      notifyListeners();
    }).catchError((e){
      onFail();
      print("ESSE É O ERRO ============================================>${e}");
      estaCarregando = false;
      notifyListeners();
    });

  }

  void login({@required String email, @required String pass,
    @required VoidCallback onSuccess, @required VoidCallback onFail}) async {

    estaCarregando = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
            (user) async {
          firebaseUsuario = user;

          await _loadCurrentUser();

          onSuccess();
          estaCarregando = false;
          notifyListeners();

        }).catchError((e){
      print("ESSE É O ERRO ============================================>${e}");
      onFail();
      estaCarregando = false;
      notifyListeners();
    });

  }

  void deslogar() async {
    await _auth.signOut();

    usuarioData = Map();
    firebaseUsuario = null;

    notifyListeners();
  }

  void recuperarSenha(String email){
       _auth.sendPasswordResetEmail(email: email);

  }

  bool estaLogado(){
    return firebaseUsuario != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.usuarioData = userData;
    await Firestore.instance.collection("usuarios").document(firebaseUsuario.uid).setData(userData);
  }

  Future<Null> _loadCurrentUser() async {
    if(firebaseUsuario == null)
      firebaseUsuario = await _auth.currentUser();
    if(firebaseUsuario != null){
      if(usuarioData["nome"] == null){
        DocumentSnapshot docUser =
        await Firestore.instance.collection("usuarios").document(firebaseUsuario.uid).get();
        usuarioData = docUser.data;
      }
    }
    notifyListeners();
  }

}