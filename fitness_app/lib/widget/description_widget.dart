import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants/colors.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.descriptions,
  });

  final String descriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(title: "Descriptions"),
          const SizedBox(
            height: 15,
          ),
          ReadMoreText(
            descriptions,
            trimLines: 4,
            textAlign: TextAlign.start,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read More",
            trimExpandedText: "Less",
            lessStyle: const TextStyle(
              color: AppColor.amber,
              fontWeight: FontWeight.w400,
            ),
            moreStyle: const TextStyle(
              color: AppColor.amber,
              fontWeight: FontWeight.w400,
            ),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.gray_1,
            ),
          )
        ],
      ),
    );
  }
}