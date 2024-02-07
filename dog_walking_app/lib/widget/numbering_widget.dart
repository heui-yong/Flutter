import 'package:flutter/cupertino.dart';
import '../constants/app_color.dart';

class NumberingWidget extends StatelessWidget {
  const NumberingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepWidget(step: "1",),
        StepDivider(),
        StepWidget(step: "2",),
        StepDivider(),
        StepWidget(step: "3",),
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key, required this.step,
  });

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: step == "1" ? AppColor.white : AppColor.darkGray,
          shape: BoxShape.circle
      ),
      child: Text(
        step,
        style: TextStyle(
            color: step == "1" ? AppColor.black : AppColor.white,
            fontSize: 13,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class StepDivider extends StatelessWidget {
  const StepDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 10,
        height: 1.5,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(1.5)
        ),
      ),
    );
  }
}