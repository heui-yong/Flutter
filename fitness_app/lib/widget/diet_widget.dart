import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';
import '../../../model/diet_model.dart';
import '../../../util/color_util.dart';
import '../page/meal_tracker/diet_info_screen.dart';

class DietWidget extends StatefulWidget {
  const DietWidget({
    super.key,
    required this.diet,
  });

  final List<Diet> diet;

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  var _hoverIndex = -1;

  void _openDietInfoBottomSheet(Diet diet) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(
              curve: curve,
            ),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            DietInfoScreen(
              name: diet.name,
              dietInfoModel: DietInfoModel(),
            ),
        fullscreenDialog: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: TitleTextWidget(title: "Recommendation\nfor Diet"),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 30),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: widget.diet.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                    color:
                    Color(int.parse(widget.diet[index].boxColor)).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 116,
                      height: 80,
                      child: SvgPicture.asset(widget.diet[index].imageUrl),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.diet[index].name,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.diet[index].level} | ${widget.diet[index].duration} | ${widget.diet[index].calorie}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.gray_1
                          ),
                        )
                      ],
                    ),
                    MouseRegion(
                      onEnter: (event) => setState(() {
                        _hoverIndex = index;
                      }),
                      onExit: (event) => setState(() {
                        _hoverIndex = -1;
                      }),
                      child: Container(
                        width: 110,
                        height: 38,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _hoverIndex == index ?
                            ColorUtil.setViewLinearColor(widget.diet[index].boxColor) :
                            [Colors.transparent, Colors.transparent],
                          ),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("click ${widget.diet[index].name}");
                            _openDietInfoBottomSheet(widget.diet[index]);
                          },
                          child: GradientText(
                            "View",
                            colors: _hoverIndex != index ?
                            ColorUtil.setViewLinearColor(widget.diet[index].boxColor) :
                            [Colors.white, Colors.white],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}