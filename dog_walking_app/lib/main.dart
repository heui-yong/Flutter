import 'package:dog_walking_app/page/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DogWalkingApp());
}

class DogWalkingApp extends StatelessWidget {
  const DogWalkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
    );
  }
}

