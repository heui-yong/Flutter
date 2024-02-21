import 'package:flutter/material.dart';
import 'package:human_info_app/model/human_info_model.dart';
import 'package:human_info_app/page/human_info_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<HumanInfoModel>(
        create: (context) => HumanInfoModel(),
        child: const HumanInfoScreen(),
      )
    );
  }
}
