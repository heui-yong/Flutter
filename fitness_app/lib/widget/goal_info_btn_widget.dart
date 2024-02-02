import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/category_model.dart';
import '../model/diet_model.dart';
import '../page/meal_tracker/breakfast_screen.dart';
import '../page/sign_up_and_login/goal_info_screen.dart';

class BlueLinearBtnWidget extends StatelessWidget {
  const BlueLinearBtnWidget({
    super.key, required this.btnText,
  });

  final String btnText;

  @override
  Widget build(BuildContext context) {

    void moveToPage() {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        var page = switch(btnText) {
          "Register" => GoalInfoScreen(),
          "Confirm" => Breakfast(dietModel: DietModel(),categoryModel: CategoryModel(),),
          _ => GoalInfoScreen(),
        };

        return page;
      }));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: AppColor.blueLinear
            ),
            borderRadius: BorderRadius.circular(99)
        ),
        child: TextButton(
          onPressed: () {
            moveToPage();
          },
          child: const Padding(
            padding: EdgeInsets.only(bottom: 18, top: 18),
            child: Text(
              "Confirm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}