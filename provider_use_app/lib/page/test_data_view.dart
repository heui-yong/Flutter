import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:provider_use_app/model/test_data.dart';
import 'package:provider_use_app/providers/test_data_provider.dart';

class TestDataView extends StatefulWidget {
  const TestDataView({super.key});

  @override
  State<TestDataView> createState() => _TestDataViewState();
}

class _TestDataViewState extends State<TestDataView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TestData>>(
        future: context.read<TestDataProvider>().getTestDataList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text("id : ${data[index].id}"),
                        Text("id : ${data[index].title}"),
                      ],
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {

          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
