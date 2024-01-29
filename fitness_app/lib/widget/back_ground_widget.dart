
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 44, left: 44),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BackCircleWidget(),
          BackImageWidget(dietInfo: dietInfo),
        ],
      ),
    );
  }
}

class BackImageWidget extends StatelessWidget {
  const BackImageWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 288,
      height: 263,
      child: SvgPicture.asset(dietInfo.imageUrl),
    );
  }
}

class BackCircleWidget extends StatelessWidget {
  const BackCircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 288,
      height: 288,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColor.white.withOpacity(0.3)),
    );
  }
}