import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../model/goal_info_model.dart';

class GoalPageViewWidget extends StatelessWidget {
  const GoalPageViewWidget({
    super.key, required this.goalInfo, required this.scale,
  });

  final GoalInfo goalInfo;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 350),
        tween: Tween(begin: scale, end: scale),
        curve: Curves.ease,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
                colors: AppColor.blueLinear
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  SvgPicture.asset(goalInfo.imageUrl),
                  const SizedBox(height: 30,),
                  Text(
                    goalInfo.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColor.white
                    ),
                  ),
                  const SizedBox(height: 3,),
                  const SizedBox(width: 50,
                      child: Divider(color: AppColor.white, thickness: 1.0)
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    goalInfo.description,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}