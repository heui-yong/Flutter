import 'package:flutter/material.dart';
import 'package:json_serializable_app/provider/human_info_provier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final provider = HumanInfoProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<HumanInfoProvider>(
        create: (context) => provider,
        child: Placeholder(),
      ),
    );
  }
}
