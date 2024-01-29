import 'package:fitness_app/widget/step_by_step_widget.dart';
import 'package:fitness_app/widget/swap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../model/diet_info_model.dart';
import 'description_widget.dart';
import 'ingredient_widget.dart';
import 'name_widget.dart';
import 'nutrition_widget.dart';

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
      if (widget.myScrollController.size == 0) {
        print("exit diet_info_screen");
        Navigator.pop(context);
      }
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
            color: AppColor.white,
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