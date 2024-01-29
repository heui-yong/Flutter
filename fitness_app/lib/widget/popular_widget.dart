import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_model.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
    required this.diet,
  });

  final List<Diet> diet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(title: "Popular"),
          const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
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
                            color: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                          style: const TextStyle(
                              color: AppColor.gray_1,
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
      ),
    );
  }
}