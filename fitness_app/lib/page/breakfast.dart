import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../model/category_model.dart';
import '../model/diet_model.dart';
import 'diet_info.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            const SizedBox(height: 30,),
            CategoryWidget(category: category),
            const SizedBox(height: 30,),
            DietWidget(diet: diet),
            const SizedBox(height: 30,),
            PopularWidget(diet: diet),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      elevation: 0.0,
      toolbarHeight: 72,
      centerTitle: true,
      leadingWidth: 62,
      leading: GestureDetector(
        onTap: () {
          print("Back Click!");
        },
        child: Container(
          margin: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
          alignment: Alignment.center,
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            "assets/icons/Back-Navs.svg",
            fit: BoxFit.fill,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("Detail click!");
          },
          child: Container(
            margin: const EdgeInsets.only(right: 30),
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

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 34, left: 30, right: 30),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1d1617).withOpacity(0.07),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
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
              child: SvgPicture.asset("assets/icons/Search.svg"),
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
                      child: SvgPicture.asset("assets/icons/Filter.svg"),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 30),
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                    color: Color(int.parse(category[index].boxColor))
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(category[index].imageUrl, fit: BoxFit.scaleDown),
                    ),
                    Text(
                      category[index].name,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
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
}

class DietWidget extends StatefulWidget {
  const DietWidget({
    super.key,
    required this.diet,
  });

  final List<Diet> diet;

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  var _hoverIndex = -1;
  static const colors = {
    "0xff9DCEFF": [Color(0xff9DCEFF), Color(0xff92A3FD)],
    "0xffEEA4CE": [Color(0xffEEA4CE), Color(0xffC58BF2)],
  };

  setViewBtnColor(int index) {
    if (_hoverIndex == index) {
      return colors[widget.diet[index].boxColor] ?? [const Color(0xff9DCEFF), const Color(0xff92A3FD)];
    } else {
      return [Colors.transparent, Colors.transparent];
    }
  }

  setVewBtnTextColor(int index) {
    if (_hoverIndex != index) {
      return colors[widget.diet[index].boxColor] ?? [const Color(0xff9DCEFF), const Color(0xff92A3FD)];
    } else {
      return [Colors.white, Colors.white];
    }
  }

  void _openDietInfoBottomSheet(String selectName) {
    showModalBottomSheet(
        context: context, builder: (context) => DietInfo(selectName: selectName,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
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
            padding: const EdgeInsets.only(left: 30),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: widget.diet.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                    color:
                        Color(int.parse(widget.diet[index].boxColor)).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 116,
                      height: 80,
                      child: SvgPicture.asset(widget.diet[index].imageUrl),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.diet[index].name,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.diet[index].level} | ${widget.diet[index].duration} | ${widget.diet[index].calorie}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7b6f72)),
                        )
                      ],
                    ),
                    MouseRegion(
                      onEnter: (event) => setState(() {
                        _hoverIndex = index;
                      }),
                      onExit: (event) => setState(() {
                        _hoverIndex = -1;
                      }),
                      child: Container(
                        width: 110,
                        height: 38,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: setViewBtnColor(index),
                          ),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("click ${widget.diet[index].name}");
                            _openDietInfoBottomSheet(widget.diet[index].name);
                          },
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) => LinearGradient(
                                colors: setVewBtnTextColor(index)
                            ).createShader(bounds),
                            child: const Text(
                              "View",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
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
}

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
    required this.diet,
  });

  final List<Diet> diet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
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
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 30, right: 30),
          itemBuilder: (context, index) {
            return Container(
              width: 315,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff1d1617).withOpacity(0.07),
                      blurRadius: 40,
                      spreadRadius: 0.0)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 90,
                      height: 80,
                      child: SvgPicture.asset(diet[index].imageUrl),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        diet[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3,),
                      Text(
                        "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [Color(0xffEEA4CE), Color(0xffC58BF2)]),
                        width: 0.8,
                      ),
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.only(right: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          SvgPicture.asset("assets/icons/arrow-gradient.svg"),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: diet.length,
        )
      ],
    );
  }
}
