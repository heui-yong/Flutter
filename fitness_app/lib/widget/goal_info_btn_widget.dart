import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GoalInfoBtnWidget extends StatelessWidget {
  const GoalInfoBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            print("select!");
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