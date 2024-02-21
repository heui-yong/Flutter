class TestData {
  int id;
  String title;

  TestData({
    required this.id,
    required this.title
  });

  factory TestData.fromJson(Map<String, dynamic> json) {
    return TestData(
      id: json['id'],
      title: json['title'],
    );
  }
}