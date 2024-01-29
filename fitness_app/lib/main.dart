import 'package:fitness_app/page/meal_tracker/breakfast_screen.dart';
import 'package:fitness_app/page/on_boarding/fitnest_x_start.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/model/category_model.dart';
import '../model/diet_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // FitNestXStart()
      Breakfast(
        categoryModel: CategoryModel(),
        dietModel: DietModel(),
      ),
    );
  }
}

