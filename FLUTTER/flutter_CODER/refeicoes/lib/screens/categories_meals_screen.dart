import 'package:flutter/material.dart';
import 'package:refeicoes/components/adaptativeAppBar.dart';
import 'package:refeicoes/components/meal_item.dart';
import 'package:refeicoes/data/dummy_data.dart';
import 'package:refeicoes/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AdaptativeAppBar(tituloCategoria: category.title,tamanhoFonte:35)),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(categoryMeals[index]),
      ),
    );
  }
}
