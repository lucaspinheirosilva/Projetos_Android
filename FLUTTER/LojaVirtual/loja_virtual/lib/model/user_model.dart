import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Map<String, dynamic> usuarioData = Map();
  bool isLoading = false;

  void cadastrar(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(email: userData['emal'], password: pass)
        .then((user) async {
      firebaseUser = user;

      await _saveUserData(userData);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((erro) {
      onFail();
      isLoading = false;
    });
  }

  void login() {}
  void recuperarSenha() {}

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.usuarioData = userData;
    await Firestore.instance
        .collection("usuarios")
        .document(firebaseUser.uid)
        .setData(userData);
  }
}
