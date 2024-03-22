import 'package:flutter/material.dart';
import 'package:refeicoes/models/meal.dart';

import '../components/adaptativeAppBar.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AdaptativeAppBar(tituloCategoria:meal.title,tamanhoFonte: 25,),
      ),
      body: Center(child: Text("Detalhe da Refeição")),
    );
  }
}
