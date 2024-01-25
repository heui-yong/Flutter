import 'package:fitness_app/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

    return Material(
      child: Stack(
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
              TittleWidget(),
              BackGroundWidget(dietInfo: dietInfo),
            ],
          ),
          DraggableBottomSheet(
            context: context, dietInfo: dietInfo
          )
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
    return Container(
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

class DraggableBottomSheet extends StatefulWidget {
// const DraggableBottomSheet({Key? key, required this.context}) : super(key: key);
  const DraggableBottomSheet({
    super.key,
    required this.context,
    required this.dietInfo,
  });

  final BuildContext context;
  final DietInfo dietInfo;

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {

  double screenHeight = 0;
  double viewHeight = 0;

  @override
  void initState() {
    super.initState();
    screenHeight = MediaQuery.of(widget.context).size.height;
    print("$screenHeight");
    viewHeight = screenHeight * 0.5; // Provide your initial value here;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          height: viewHeight,
          width: double.infinity,
          child: GestureDetector(
            onVerticalDragStart: (details) {
              // print("$details");
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                viewHeight = (screenHeight - details.globalPosition.dy)
                    .clamp(30.0, screenHeight *0.9);
                print("${viewHeight}");
              });
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xff1D1617).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
                NameWidget(widget: widget),
                NutritionWidget(widget: widget),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
                  child: Column(
                    children: [
                      Text(widget.dietInfo.descriptions),
                      Text(widget.dietInfo.descriptions)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.widget,
  });

  final DraggableBottomSheet widget;

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
              Text(
                widget.dietInfo.name,
                style: TextStyleUtil.getTitleTextStyle()
              ),
              const SizedBox(height: 5,),
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
                    widget.dietInfo.writer,
                    colors: ColorUtil.setViewLinearColor(widget.dietInfo.boxColor),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),
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
    required this.widget,
  });

  final DraggableBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Nutrition",
              style: TextStyleUtil.getTitleTextStyle()
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(int.parse(widget.dietInfo.boxColor)).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(widget.dietInfo.nutrition[index].imageUrl),
                        const SizedBox(width: 5,),
                        Text(
                          widget.dietInfo.nutrition[index].content,
                          style: TextStyle(
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
              itemCount: widget.dietInfo.nutrition.length,
            ),
          ),
        ],
      ),
    );
  }
}
