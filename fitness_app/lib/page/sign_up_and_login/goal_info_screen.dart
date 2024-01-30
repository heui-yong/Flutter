import 'package:fitness_app/model/goal_info_model.dart';
import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';
import '../../widget/goal_info_btn_widget.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 40,),
          const GogalInfoTitleWidget(),
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
                var _scale = _selectedIndex == index ? 1.0 : 0.8;
                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 350),
                  tween: Tween(begin: _scale, end: _scale),
                  curve: Curves.ease,
                  child: GoalImageWidget(goalInfo: goalInfoList[index],),
                  builder: (context, vallue, child) {
                    return Transform.scale(
                      scale: vallue,
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 73,),
          const GoalInfoBtnWidget(),
        ],
      ),
    );
  }
}

class GogalInfoTitleWidget extends StatelessWidget {
  const GogalInfoTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleTextWidget(
            title: "What is your goal ?",
          ),
          Text(
            "It will help us to choose a best program for you"
          ),
        ],
      ),
    );
  }
}

class GoalImageWidget extends StatelessWidget {
  const GoalImageWidget({
    super.key, required this.goalInfo,
  });

  final GoalInfo goalInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: AppColor.blueLinear
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 30,),
          SvgPicture.asset(goalInfo.imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  goalInfo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColor.white
                  ),
                ),
                Container(width: 50,
                    child: Divider(color: AppColor.white, thickness: 1.0)
                ),
                Text(
                  goalInfo.description,
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}