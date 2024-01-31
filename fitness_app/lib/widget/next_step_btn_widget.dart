import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/category_model.dart';
import '../model/diet_model.dart';
import '../model/on_boarding_model.dart';
import '../page/meal_tracker/breakfast_screen.dart';
<<<<<<< HEAD
import '../page/sign_up_and_login/goal_info_screen.dart';
=======
>>>>>>> origin/main

class NextStepBtnWidget extends StatefulWidget {
  const NextStepBtnWidget({
    super.key,
    required this.controller, required this.onBoardingList,
  });

  final PageController controller;
  final List<OnBoarding> onBoardingList;

  @override
  State<NextStepBtnWidget> createState() => _NextStepBtnWidgetState();
}

class _NextStepBtnWidgetState extends State<NextStepBtnWidget> {
  var selectPage = 0;

  void _moveBreakfastScreen() {
    Navigator.push(context, MaterialPageRoute(
<<<<<<< HEAD
        builder: (context) => GoalInfoScreen()
        //     Breakfast(
        //   categoryModel: CategoryModel(),
        //   dietModel: DietModel(),
        // )
=======
        builder: (context) => Breakfast(
          categoryModel: CategoryModel(),
          dietModel: DietModel(),
        )
>>>>>>> origin/main
    ));
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      selectPage = widget.controller.page?.round() ?? 0;

      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: (selectPage+1) / 4,
              color: AppColor.blue_1,
              strokeWidth: 2,
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: AppColor.blueLinear
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              color: AppColor.white,
              onPressed: () {
                if(selectPage < widget.onBoardingList.length) {
                  selectPage = selectPage+1;
                  if(selectPage == widget.onBoardingList.length) {
                    selectPage = selectPage-1;
                    _moveBreakfastScreen();
                  } else {
                    widget.controller.jumpToPage(selectPage);

                    setState(() {

                    });
                  }
                } else {
                  print("selectPage : $selectPage");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}