import 'package:flutter/cupertino.dart';
import 'package:provider_use_app/services/api_service.dart';

import '../model/test_data.dart';

class TestDataProvider with ChangeNotifier {
  final Future<List<TestData>> _testDataList;
  List<TestData>? _cachedTestData;

  TestDataProvider() : _testDataList = ApiService().fetchTestData();

  Future<List<TestData>> get testDataList async {
    return _cachedTestData ??= await _testDataList;
  }

  Future<List<TestData>> getTestDataList() async {
    notifyListeners();
    return testDataList;
  }
}

