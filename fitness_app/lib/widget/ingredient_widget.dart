import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
    required this.ingredients,
  });

  final List<Ingredients> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleTextWidget(title: "Ingredients That You\nWill Need"),
                Text(
                  "${ingredients.length} items",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.gray_1,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 125,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF7F8F8)),
                      child: SvgPicture.asset(
                        ingredients[index].imageUrl,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ingredients[index].name,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ingredients[index].mensuration,
                      style: const TextStyle(
                        color: AppColor.gray_1,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount: ingredients.length,
            ),
          ),
        ],
      ),
    );
  }
}