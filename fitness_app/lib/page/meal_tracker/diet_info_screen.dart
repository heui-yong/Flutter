import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/util/color_util.dart';
import 'package:flutter/material.dart';
import '../../model/diet_info_model.dart';
import '../../widget/back_ground_widget.dart';
import '../../widget/bottom_sheet_widget.dart';
import '../../widget/tittle_widget.dart';

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
      floatingActionButton: CustomFab(
        myScrollController: myScrollController,
        boxColor: dietInfo.boxColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

class CustomFab extends StatefulWidget {
  const CustomFab({
    super.key, required this.myScrollController, required this.boxColor,
  });

  final DraggableScrollableController myScrollController;
  final String boxColor;

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  var isVisible = true;

  @override
  void initState() {
    widget.myScrollController.addListener(() {
      if (widget.myScrollController.size > 0.5) {
        setState(() {
          isVisible = false;
        });
      } else {
        setState(() {
          isVisible = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            onPressed: () {  },
            elevation: 0.0,
            backgroundColor: AppColor.transparent,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorUtil.setViewLinearColor(widget.boxColor)
                ),
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Text(
                  "Add to Breakfast Meal",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

