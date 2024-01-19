import 'dart:convert';

class CategoryModel {
  final Map<String, dynamic> _json;
  CategoryModel() : _json = jsonDecode(categoryJson);

  List<Category> getCategory() {
    if (_json case {'category' : List categoryList}) {
      return <Category>[
        for (var category in categoryList) Category.fromJson(category)
      ];
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

class Category{
  String name;
  String imageUrl;
  String boxColor;
  Category({required this.name, required this.imageUrl, required this.boxColor});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        name: json['name'],
        imageUrl: json['imageUrl'],
        boxColor: json['boxColor']
    );
  }
}


const categoryJson = '''
{
  "category" : [
    {
      "name": "Salad",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/salad.svg"
    },
    {
      "name": "Cake",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/pancakes.svg"
    },
    {
      "name": "Pie",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/Vector.svg"
    },
    {
      "name": "Smoothies",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/orange-snacks.svg"
    },
    {
      "name": "Salad",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/salad.svg"
    }
  ]
}
''';