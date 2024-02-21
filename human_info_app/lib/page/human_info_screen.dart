import 'package:flutter/material.dart';
import 'package:human_info_app/model/human_info_model.dart';
import 'package:provider/provider.dart';

class HumanInfoScreen extends StatelessWidget {
  const HumanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60,),
            InfoDataEditWidget(dataType: "Age"),
            SizedBox(height: 30,),
            InfoDataEditWidget(dataType: "Height"),
            SizedBox(height: 30,),
            InfoDataEditWidget(dataType: "Weight"),
            SizedBox(height: 30,),
            Text("=====HumanInfo====="),
            HumanInfoWidget(),
          ],
        ),
      ),
    );
  }
}

class InfoDataEditWidget extends StatelessWidget {
  final String dataType;
  const InfoDataEditWidget({
    super.key,
    required this.dataType
  });

  @override
  Widget build(BuildContext context) {
    var readHumanInfo = context.read<HumanInfoModel>();
    var selectHumanInfo = context.select<HumanInfoModel, int>;

    var data = switch(dataType) {
      "Age" => "${selectHumanInfo((provider) => provider.humanInfo.age).toString()}살",
      "Height" => "${selectHumanInfo((provider) => provider.humanInfo.height).toString()}cm",
      "Weight" => "${selectHumanInfo((provider) => provider.humanInfo.weight).toString()}kg",
      _ => ""
    };

    onClick(int op) {
      int data = (op < 0) ? -1 : 1;
      switch(dataType) {
        case "Age" : readHumanInfo.setAge(data);
        case "Height" : readHumanInfo.setHeight(data);
        case "Weight" : readHumanInfo.setWeight(data);
      }
    }

    return Column(
      children: [
        Text(dataType),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {onClick(-1);},
              child: const Text('-'),
            ),
            const SizedBox(width: 30,),
            Text(
                data
            ),
            const SizedBox(width: 30,),
            ElevatedButton(
              onPressed: () {onClick(1);},
              child: const Text('+'),
            ),
          ],
        )
      ],
    );
  }
}

class HumanInfoWidget extends StatelessWidget {
  const HumanInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var humanInfo = context.watch<HumanInfoModel>().humanInfo;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("name:${humanInfo.name}"),
              const SizedBox(height: 20,),
              Text("age:${humanInfo.age}"),
              const SizedBox(height: 20,),
              Text("height:${humanInfo.height}"),
              const SizedBox(height: 20,),
              Text("weight:${humanInfo.weight}")
            ],
          ),
        ),
      ),
    );
  }
}