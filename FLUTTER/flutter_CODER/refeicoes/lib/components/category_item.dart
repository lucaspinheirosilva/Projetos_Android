import 'package:flutter/material.dart';
import 'package:refeicoes/models/category.dart';
import 'package:refeicoes/screens/categories_meals_screen.dart';
import 'package:refeicoes/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoute.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.5),
            category.color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
