import 'package:dotted_line/dotted_line.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../model/diet_info_model.dart';
import '../util/text_style_util.dart';

class DietInfoScreen extends StatelessWidget {
  final String name;
  final DietInfoModel dietInfoModel;

  const DietInfoScreen({
    required this.name,
    Key? key,
    required this.dietInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dietInfo = dietInfoModel.getDietInfo(name);
    DraggableScrollableController myScrollController =
        DraggableScrollableController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ColorUtil.setViewLinearColor(dietInfo.boxColor),
              ),
            ),
          ),
          Column(
            children: [
              const TittleWidget(),
              BackGroundWidget(dietInfo: dietInfo),
            ],
          ),
          BottomSheetWidget(
            dietInfo: dietInfo,
            myScrollController: myScrollController,
          ),
        ],
      ),
    );
  }
}

class TittleWidget extends StatelessWidget {
  const TittleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child: SvgPicture.asset("assets/icons/Back-Navs.svg"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => print("디테일!"),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child: SvgPicture.asset("assets/icons/Detail-Navs.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget(
      {super.key, required this.dietInfo, required this.myScrollController});

  final DietInfo dietInfo;
  final DraggableScrollableController myScrollController;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  void initState() {
    widget.myScrollController.addListener(() {
      print("size : ${widget.myScrollController.size}");
      // if (widget.myScrollController.size < 0.1) {
      //   Navigator.pop(context);
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0,
      maxChildSize: 1.0,

      controller: widget.myScrollController,
      builder: (context, myScrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              controller: myScrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SwapWidget(),
                  NameWidget(dietInfo: widget.dietInfo),
                  NutritionWidget(dietInfo: widget.dietInfo),
                  DescriptionWidget(descriptions: widget.dietInfo.descriptions),
                  IngredientWidget(ingredients: widget.dietInfo.ingredients),
                  StepByStepWidget(step: widget.dietInfo.step)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SwapWidget extends StatelessWidget {
  const SwapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 50,
      height: 5,
      decoration: BoxDecoration(
          color: const Color(0xff1D1617).withOpacity(0.1),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dietInfo.name, style: TextStyleUtil.getTitleTextStyle()),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "by ",
                    style: TextStyle(
                      color: Color(0xff7B6F72),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GradientText(
                    dietInfo.writer,
                    colors: ColorUtil.setViewLinearColor(dietInfo.boxColor),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/icons/heart.svg"),
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({
    super.key,
    required this.dietInfo,
  });

  final DietInfo dietInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nutrition", style: TextStyleUtil.getTitleTextStyle()),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(int.parse(dietInfo.boxColor)).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(dietInfo.nutrition[index].imageUrl),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          dietInfo.nutrition[index].content,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount: dietInfo.nutrition.length,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.descriptions,
  });

  final String descriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descriptions",
            style: TextStyleUtil.getTitleTextStyle(),
          ),
          const SizedBox(
            height: 15,
          ),
          ReadMoreText(
            descriptions,
            trimLines: 4,
            textAlign: TextAlign.start,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read More",
            trimExpandedText: "Less",
            lessStyle: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w400,
            ),
            moreStyle: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w400,
            ),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff7B6F72),
            ),
          )
          // Text.rich(
          //   TextSpan(
          //     text: descriptions,
          //     style: TextStyle(
          //       fontSize: 12,
          //       fontWeight: FontWeight.w400,
          //       color: Color(0xff7B6F72)
          //     ),
          //     children: [
          //       WidgetSpan(
          //         child: Container(
          //           child: GestureDetector(
          //             onTap: () => print("Read more..."),
          //             child: Text("Read more..."),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
    required this.ingredients,
  });

  final List<Ingredients> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredients That You\nWill Need",
                  style: TextStyleUtil.getTitleTextStyle(),
                  softWrap: true,
                ),
                Text(
                  "${ingredients.length} items",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B6F72),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 125,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF7F8F8)),
                      child: SvgPicture.asset(
                        ingredients[index].imageUrl,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ingredients[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ingredients[index].mensuration,
                      style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount: ingredients.length,
            ),
          ),
        ],
      ),
    );
  }
}

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
              Text(
                "Step by Step",
                style: TextStyleUtil.getTitleTextStyle(),
                softWrap: true,
              ),
              Text(
                "${widget.step.length} items",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7B6F72),
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
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.step[index].description,
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
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
