import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screen/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["icon"]),
      ),
      title: Text(
        snapshot.data["title"],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.black,
        backgroundImage: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/lojavirtual-827d7.appspot.com/o/Icones%2Fseta.png?alt=media&token=e2985559-ccc5-4de6-962b-5965795857d7"),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(snapshot)));
      },
    );
  }
}
