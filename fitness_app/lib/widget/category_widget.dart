import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/colors.dart';
import '../../../model/category_model.dart';

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
          padding: EdgeInsets.only(right: 30, left: 30),
          child: TitleTextWidget(title: "Category"),
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
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(category[index].imageUrl, fit: BoxFit.scaleDown),
                    ),
                    Text(
                      category[index].name,
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColor.black,
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