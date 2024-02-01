import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import '../constants/colors.dart';

class GoalInfoTitleWidget extends StatelessWidget {
  const GoalInfoTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleTextWidget(
            title: "What is your goal ?",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "It will help us to choose a best program for you",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.gray_1
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}