import 'package:fitness_app/model/goal_info_model.dart';
import 'package:flutter/material.dart';
import '../../widget/goal_info_btn_widget.dart';
import '../../widget/goal_info_title_widget.dart';
import '../../widget/goal_page_view_widget.dart';

class GoalInfoScreen extends StatefulWidget {
  const GoalInfoScreen({super.key});

  @override
  State<GoalInfoScreen> createState() => _GoalInfoScreenState();
}

class _GoalInfoScreenState extends State<GoalInfoScreen> {
  late PageController _pageController;
  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    var goalInfoModel = GoalInfoModel();
    var goalInfoList = goalInfoModel.getGoalInfo();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const GoalInfoTitleWidget(),
            const SizedBox(height: 50,),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: _pageController,
                itemCount: goalInfoList.length,
                itemBuilder: (context, index) {
                  var scale = _selectedIndex == index ? 1.0 : 0.8;
                  return GoalPageViewWidget(goalInfo: goalInfoList[index], scale: scale,);
                },
              ),
            ),
            const SizedBox(height: 73,),
            const BlueLinearBtnWidget(btnText: 'Confirm',),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}