import 'package:flutter/material.dart';
import 'package:refeicoes/components/adaptativeAppBar.dart';
import 'package:refeicoes/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AdaptativeAppBar(category.title)),
      body: Center(
        child: Text('Receitas por categorias ${category.id}'),
      ),
    );
  }
}
