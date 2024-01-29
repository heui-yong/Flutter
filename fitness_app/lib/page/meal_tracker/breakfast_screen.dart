import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/category_model.dart';
import '../../model/diet_model.dart';
import '../../widget/category_widget.dart';
import '../../widget/diet_widget.dart';
import '../../widget/popular_widget.dart';
import '../../widget/search_bar_widget.dart';

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
            color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      elevation: 0.0,
      centerTitle: true,
      leadingWidth: 62,
      leading: GestureDetector(
        onTap: () {
          print("Back Click!");
        },
        child: Container(
          margin: const EdgeInsets.only(left: 30, top: 12, bottom: 12),
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
