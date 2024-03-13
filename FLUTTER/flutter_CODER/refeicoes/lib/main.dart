import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals_screen.dart';
import 'package:refeicoes/screens/category_screen.dart';
import 'package:refeicoes/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.purple[400],
          secondary: Colors.amber,
          tertiary: Colors.white,
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
          background: const Color.fromRGBO(255, 254, 229, 1),
        ),
        textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 35,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      initialRoute: AppRoute.HOME,
      routes: {
        AppRoute.HOME: (context) => CategoriesScreen(),
        AppRoute.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
      },
    );
  }
}
