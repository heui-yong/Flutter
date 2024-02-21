import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_use_app/model/test_data.dart';

class ApiService {
  final url = Uri.parse("https://raw.githubusercontent.com/heui-yong/Flutter/main/Json/provider_use_app_json/provider_test.json");

  Future<List<TestData>> fetchTestData() async {
    List<TestData> testData = [];

    try{
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<TestData> data = jsonDecode(response.body)
            .map<TestData>((json) => TestData.fromJson(json)).toList();
        testData.addAll(data);

        return testData;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}