import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../model/on_boarding_model.dart';
import '../../widget/next_step_btn_widget.dart';
import '../../widget/on_boarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var onBoardingModel = OnBoardingModel();
    PageController controller = PageController();
    var onBoardingList = onBoardingModel.getOnBoarding();

    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) {
              return OnBoardingWidget(onBoarding: onBoardingList[index]);
            },
          ),
          NextStepBtnWidget(
            controller: controller,
            onBoardingList: onBoardingList,
          ),
        ],
      )
    );
  }
}