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

