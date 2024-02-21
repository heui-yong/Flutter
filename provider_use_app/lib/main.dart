import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_use_app/page/test_data_view.dart';
import 'package:provider_use_app/providers/test_data_provider.dart';

void main() {
  runApp(const ProviderUseApp());
}

class ProviderUseApp extends StatelessWidget {
  const ProviderUseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TestDataProvider>(
        create: (context) => TestDataProvider(),
        child: TestDataView(),
      )
    );
  }
}
