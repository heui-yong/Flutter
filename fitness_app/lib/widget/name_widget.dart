import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';
import '../../../util/color_util.dart';


class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextWidget(title: dietInfo.name),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "by ",
                    style: TextStyle(
                      color: AppColor.gray_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GradientText(
                    dietInfo.writer,
                    colors: ColorUtil.setViewLinearColor(dietInfo.boxColor),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/icons/heart.svg"),
            ),
          ),
        ],
      ),
    );
  }
}