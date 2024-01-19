import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/category_model.dart';
import '../model/diet_model.dart';

class Breakfast extends StatelessWidget {
  final CategoryModel categoryModel;
  final DietModel dietModel;

  const Breakfast({
    required this.categoryModel,
    required this.dietModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = categoryModel.getCategory();
    var diet = dietModel.getDietInfo();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBar(),
              const SizedBox(height: 30,),
              categoryMethod(category),
              const SizedBox(height: 30,),
              dietMethod(diet),
              const SizedBox(height: 30,),
              popularMethod(diet)
            ],
          ),
        ),
      ),
    );
  }

  Column popularMethod(List<Diet> diet) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 315,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(16)
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 15,),
                  padding: const EdgeInsets.only(
                      left: 30,
                      right: 30
                  ),
                  itemCount: diet.length,
                ),
              )
            ],
          );
  }

  Column dietMethod(List<Diet> diet) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                maxLines: 2,
                "Recommendation\nfor Diet",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 15,),
                padding: const EdgeInsets.only(
                    left: 30,
                    right: 30
                ),
                itemCount: diet.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 240,
                    decoration: BoxDecoration(
                      color: Color(int.parse(diet[index].boxColor)).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 116,
                          height: 80,
                          child: SvgPicture.asset(diet[index].imageUrl),
                        ),
                        Column(
                          children: [
                            Text(
                              diet[index].name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7b6f72)
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 110,
                          height: 38,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: setViewBtnColor(diet[index].boxColor)
                            ),
                            borderRadius: BorderRadius.circular(99)
                          ),
                          child: ElevatedButton(
                            onPressed: () {  },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: const Text(
                              "View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  setViewBtnColor(String boxColor) {
    return switch (boxColor) {
      "0xff9DCEFF" => [const Color(0xff9DCEFF), const Color(0xff92A3FD)],
      "0xffEEA4CE" => [const Color(0xffEEA4CE), const Color(0xffC58BF2)],
      _ => [const Color(0xff9DCEFF), const Color(0xff92A3FD)]
    };
  }

  Column categoryMethod(List<Category> category) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 15,),
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(int.parse(category[index].boxColor)).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, right: 3, left: 3, bottom: 10),
                              child: SvgPicture.asset(category[index].imageUrl),
                            ),
                          ),
                          Text(
                            category[index].name,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                    );
                  },
              ),
            ),
          ],
        );
  }

  Container searchBar() {
    return Container(
          margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1d1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: "Search Pancake",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffDDDADA),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  "assets/icons/Search.svg",
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          "assets/icons/Filter.svg",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print("Back Click!");
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(
            "assets/icons/Back-Navs.svg",
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("Detail click!");
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              "assets/icons/Detail-Navs.svg",
            ),
          ),
        ),
      ],
    );
  }
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
