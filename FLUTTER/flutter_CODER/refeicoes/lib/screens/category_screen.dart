import 'package:flutter/material.dart';
import 'package:refeicoes/components/adaptativeAppBar.dart';

import 'package:refeicoes/components/category_item.dart';
import 'package:refeicoes/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const PreferredSize(
          preferredSize: Size.fromHeight(70.0), child: AdaptativeAppBar('Vamos Cozinhar?')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
