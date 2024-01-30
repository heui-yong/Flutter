import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.onBoarding});

  final OnBoarding onBoarding;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return SizedBox(
      width: media.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              onBoarding.imageUrl,
              width: media.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: media.height*0.1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onBoarding.title,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    onBoarding.subTitle,
                    style: const TextStyle(
                        color: AppColor.gray_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
