import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(title: "Nutrition"),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(int.parse(dietInfo.boxColor)).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(dietInfo.nutrition[index].imageUrl),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          dietInfo.nutrition[index].content,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount: dietInfo.nutrition.length,
            ),
          ),
        ],
      ),
    );
  }
}