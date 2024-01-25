import 'dart:convert';

class DietInfoModel {
  final Map<String, dynamic> _json;
  DietInfoModel() : _json = jsonDecode(dietInfoJson);

  DietInfo getDietInfo(String name) {
    if (_json case {'diet' : List dietInfoList}) {
      return dietInfoList.firstWhere((dietInfo) => dietInfo['name'] == name) == null
          ? throw const FormatException('DietInfo with name not found')
          : DietInfo.fromJson(dietInfoList.firstWhere((dietInfo) => dietInfo['name'] == name));
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

class DietInfo{
  String name;
  String writer;
  String boxColor;
  String imageUrl;
  List<Nutrition> nutrition;
  String descriptions;
  List<Ingredients> ingredients;
  List<StepByStep> step;


  DietInfo({
    required this.name,
    required this.writer,
    required this.boxColor,
    required this.imageUrl,
    required this.nutrition,
    required this.descriptions,
    required this.ingredients,
    required this.step
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) {
    var nutritionList = json['nutrition'] as List;
    List<Nutrition> changeNutritionList =
        nutritionList.map<Nutrition>((e) => Nutrition.fromJson(e)).toList();

    var ingredientsList = json['ingredients'] as List;
    List<Ingredients> changeIngredientsList =
    ingredientsList.map<Ingredients>((e) => Ingredients.fromJson(e)).toList();

    var stepList = json['step'] as List;
    List<StepByStep> changeStepList =
    stepList.map<StepByStep>((e) => StepByStep.fromJson(e)).toList();

    return DietInfo(
      name: json['name'],
      writer: json['writer'],
      boxColor: json['boxColor'],
      imageUrl: json['imageUrl'],
      nutrition: changeNutritionList,
      descriptions: json['descriptions'],
      ingredients: changeIngredientsList,
      step: changeStepList,
    );
  }
}

class Nutrition {
  String type;
  String content;
  String imageUrl;

  Nutrition({
    required this.type,
    required this.content,
    required this.imageUrl
  });

  factory Nutrition.fromJson(Map<String, dynamic> json){
    return Nutrition(
        type: json['type'],
        content: json['content'],
        imageUrl: json['imageUrl'],
    );
  }
}

class Ingredients {
  String name;
  String mensuration;
  String imageUrl;

  Ingredients({
    required this.name,
    required this.mensuration,
    required this.imageUrl
  });

  factory Ingredients.fromJson(Map<String, dynamic> json){
    return Ingredients(
      name: json['name'],
      mensuration: json['mensuration'],
      imageUrl: json['imageUrl'],
    );
  }
}

class StepByStep {
  String step;
  String description;

  StepByStep({
    required this.step,
    required this.description
  });

  factory StepByStep.fromJson(Map<String, dynamic> json){
    return StepByStep(
      step: json['step'],
      description: json['description']
    );
  }
}



const dietInfoJson = '''
{
  "diet" : [
    {
      "name": "Honey Pancake",
      "writer": "James Ruth",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/pancakes.svg",
      "nutrition": [
        {
          "type": "calorie",
          "content": "180kCal",
          "imageUrl": "assets/icons/calorie.svg"
        },
        {
          "type": "fats",
          "content": "30g fats",
          "imageUrl": "assets/icons/fat.svg"
        },
        {
          "type": "proteins",
          "content": "20g proteins",
          "imageUrl": "assets/icons/protein.svg"
        },
        {
          "type": "carbohydrate",
          "content": "28g carbo",
          "imageUrl": "assets/icons/rice.svg"
        }
      ],
      "descriptions": "A pancake is a type of flat bread made by baking sweetened batter on a hot grill or in a frying pan. Pancakes come in many variations depending on numerous regional cuisines. Some pancakes are made with yeast to promote expansion or with fermented dough, but most pancakes are breads that can be made quickly.Waffles contain more eggs than pancakes and are baked using a special waffle pan. Pancakes are also different from waffles in that they are topped with syrup. Except for Breton galettes, most pancakes are cooked on one side at a time and then flipped over during the cooking process.",
      "ingredients": [
        {
          "name": "Wheat Flour",
          "mensuration": "100gr",
          "imageUrl": "assets/icons/flour.svg"
        },
        {
          "name": "Sugar",
          "mensuration": "3 tbsp",
          "imageUrl": "assets/icons/sugar.svg"
        },
        {
          "name": "Baking Soda",
          "mensuration": "2 tbsp",
          "imageUrl": "assets/icons/baking.svg"
        },
        {
          "name": "Eggs",
          "mensuration": "2 items",
          "imageUrl": "assets/icons/egg.svg"
        }
      ],
      "step": [
        { 
          "step": "Step 1",
          "description": "Prepare all of the ingredients that needed"
        },
        { 
          "step": "Step 2",
          "description": "Mix flour, sugar, salt, and baking powder"
        },
        { 
          "step": "Step 3",
          "description": "In a seperate place, mix the eggs and liquid milk until blended"
        },
        { 
          "step": "Step 4",
          "description": "this is Step 4 description, this is Step 4 description"
        },
        { 
          "step": "Step 5",
          "description": "this is Step 5 description, this is Step 5 descriptionthis is Step 5 description"
        },
        { 
          "step": "Step 6",
          "description": "this is Step 6 description,"
        },
        { 
          "step": "Step 7",
          "description": "this is Step 7 description, this is Step 7 description,"
        },
        { 
          "step": "Step 8",
          "description": "this is Step 8 description, this is Step 8 description,"
        }
      ]
    },
    {
      "name": "Orange",
      "writer": "Heui Yong",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/orange-snacks.svg",
      "nutrition": [
        {
          "type": "calorie",
          "content": "80kCal",
          "imageUrl": "assets/icons/calorie.svg"
        },
        {
          "type": "fats",
          "content": "0.1g fats",
          "imageUrl": "assets/icons/fat.svg"
        },
        {
          "type": "proteins",
          "content": "0.9g proteins",
          "imageUrl": "assets/icons/protein.svg"
        },
        {
          "type": "carbohydrate",
          "content": "10g carbo",
          "imageUrl": "assets/icons/rice.svg"
        }
      ],
      "descriptions": "The fruit of the tangerine tree. It is a fruit belonging to the tangerine genus. The etymology is Sanskrit naranga, and if we go even further back, it is said to have come from the Mongolian word meaning ‘fragrant fruit.’Originally, the word orange and its origins meant bitter orange, which was spread first, but the meaning changed when the current orange was spread to Europe around the 9th century.",
      "ingredients": [
        {
          "name": "Orange",
          "mensuration": "1 items",
          "imageUrl": "assets/icons/orange-snacks.svg"
        }
      ],
      "step": [
        { 
          "step": "Step 1",
          "description": "Go to the supermarket and buy oranges"
        }
      ]
    },
    {
      "name": "Salmon Nigiri",
      "writer": "Salmon Kimm",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/nigiri.svg",
      "nutrition": [
        {
          "type": "calorie",
          "content": "120kCal",
          "imageUrl": "assets/icons/calorie.svg"
        },
        {
          "type": "fats",
          "content": "3g fats",
          "imageUrl": "assets/icons/fat.svg"
        },
        {
          "type": "proteins",
          "content": "6g proteins",
          "imageUrl": "assets/icons/protein.svg"
        },
        {
          "type": "carbohydrate",
          "content": "21g carbo",
          "imageUrl": "assets/icons/rice.svg"
        }
      ],
      "descriptions": "Sushi is a Japanese rice dish. It is a food that combines rice with seafood such as raw fish or eggs, and is traditionally eaten with wasabi. The representative example is nigirizushi, which is made by topping fish and other items on smesh (rice with vinegar) that is squeezed by hand, but there are many other forms.",
      "ingredients": [
        {
          "name": "Rice",
          "mensuration": "300g",
          "imageUrl": "assets/icons/rice.svg"
        },
        {
          "name": "Sugar",
          "mensuration": "1 tbsp",
          "imageUrl": "assets/icons/sugar.svg"
        },
        {
          "name": "salmon sashimi",
          "mensuration": "3 item",
          "imageUrl": "assets/icons/nigiri.svg"
        }
      ],
      "step": [
        { 
          "step": "Step 1",
          "description": "this is Step 1 description, this is Step 1 description"
        },
        { 
          "step": "Step 2",
          "description": "this is Step 2 description, this is Step 2 description"
        },
        { 
          "step": "Step 3",
          "description": "this is Step 3 description, this is Step 3 description, this is Step 3 description"
        },
        { 
          "step": "Step 4",
          "description": "this is Step 4 description"
        },
        { 
          "step": "Step 5",
          "description": "this is Step 5 description, this is Step 5 descriptionthis is Step 5 description"
        }
      ]
    },
    {
      "name": "Blueberry Pancake",
      "writer": "James Ruth",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/pancake2.svg",
      "nutrition": [
        {
          "type": "calorie",
          "content": "180kCal",
          "imageUrl": "assets/icons/calorie.svg"
        },
        {
          "type": "fats",
          "content": "30g fats",
          "imageUrl": "assets/icons/fat.svg"
        },
        {
          "type": "proteins",
          "content": "20g proteins",
          "imageUrl": "assets/icons/protein.svg"
        },
        {
          "type": "carbohydrate",
          "content": "28g carbo",
          "imageUrl": "assets/icons/rice.svg"
        }
      ],
      "descriptions": "A pancake is a type of flat bread made by baking sweetened batter on a hot grill or in a frying pan. Pancakes come in many variations depending on numerous regional cuisines. Some pancakes are made with yeast to promote expansion or with fermented dough, but most pancakes are breads that can be made quickly.Waffles contain more eggs than pancakes and are baked using a special waffle pan. Pancakes are also different from waffles in that they are topped with syrup. Except for Breton galettes, most pancakes are cooked on one side at a time and then flipped over during the cooking process.",
      "ingredients": [
        {
          "name": "Wheat Flour",
          "mensuration": "100gr",
          "imageUrl": "assets/icons/flour.svg"
        },
        {
          "name": "Sugar",
          "mensuration": "3 tbsp",
          "imageUrl": "assets/icons/sugar.svg"
        },
        {
          "name": "Baking Soda",
          "mensuration": "2 tbsp",
          "imageUrl": "assets/icons/baking.svg"
        },
        {
          "name": "Eggs",
          "mensuration": "2 items",
          "imageUrl": "assets/icons/egg.svg"
        }
      ],
      "step": [
        { 
          "step": "Step 1",
          "description": "Prepare all of the ingredients that needed"
        },
        { 
          "step": "Step 2",
          "description": "Mix flour, sugar, salt, and baking powder"
        },
        { 
          "step": "Step 3",
          "description": "In a seperate place, mix the eggs and liquid milk until blended"
        },
        { 
          "step": "Step 4",
          "description": "this is Step 4 description, this is Step 4 description"
        },
        { 
          "step": "Step 5",
          "description": "this is Step 5 description, this is Step 5 descriptionthis is Step 5 description"
        },
        { 
          "step": "Step 6",
          "description": "this is Step 6 description,"
        },
        { 
          "step": "Step 7",
          "description": "this is Step 7 description, this is Step 7 description,"
        },
        { 
          "step": "Step 8",
          "description": "this is Step 8 description, this is Step 8 description,"
        }
      ]
    }
  ]
}
''';