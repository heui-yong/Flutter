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
        child: const HumanInfoScreen(),
      ),
    );
  }
}

class HumanInfoScreen extends StatefulWidget {
  const HumanInfoScreen({super.key});

  @override
  State<HumanInfoScreen> createState() => _HumanInfoScreenState();
}

class _HumanInfoScreenState extends State<HumanInfoScreen> {
  final provider = HumanInfoProvider();

  @override
  void initState() {
    super.initState();
    provider.fetchHumanInfo(); // initState에서 fetchHumanInfo 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: provider,
        child: Consumer<HumanInfoProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.humanInfoList.length,
              itemBuilder: (context, index) {
                final humanInfo = provider.humanInfoList[index];
                return ListTile(
                  title: Text(humanInfo.name),
                  subtitle: Text('${humanInfo.age}살, ${humanInfo.birthDate}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}