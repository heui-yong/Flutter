import 'package:dotted_line/dotted_line.dart';
import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';

class StepByStepWidget extends StatefulWidget {
  const StepByStepWidget({
    super.key,
    required this.step,
  });

  final List<StepByStep> step;

  @override
  State<StepByStepWidget> createState() => _StepByStepWidgetState();
}

class _StepByStepWidgetState extends State<StepByStepWidget> {
  var _stepIndex = -1;

  _setStepGradientColor(int index) {
    if (index <= _stepIndex) {
      return AppColor.purpleLinear;
    } else {
      return AppColor.greyLinear;
    }
  }

  _setStepBtnImage(int index) {
    if (index <= _stepIndex) {
      return "assets/icons/stepBtn.svg";
    } else {
      return "assets/icons/stepBtnDis.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleTextWidget(title: "Step by Step"),
              Text(
                "${widget.step.length} items",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.gray_1,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemCount: widget.step.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _stepIndex = index;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      child: GradientText(
                        "0${index + 1}",
                        colors: _setStepGradientColor(index),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          _setStepBtnImage(index),
                          height: 20,
                          width: 20,
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          alignment: WrapAlignment.center,
                          lineLength: 44,
                          dashGradient: _setStepGradientColor(index),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.step[index].step,
                            style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.step[index].description,
                            style: const TextStyle(
                                color: AppColor.gray_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}