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
                  return Center(child: GoalImageWidget(goalInfo: goalInfoList[index], scale: scale,));
                },
              ),
            ),
            const SizedBox(height: 73,),
            const GoalInfoBtnWidget(),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

class GoalInfoTitleWidget extends StatelessWidget {
  const GoalInfoTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleTextWidget(
            title: "What is your goal ?",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "It will help us to choose a best program for you",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.gray_1
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class GoalImageWidget extends StatelessWidget {
  const GoalImageWidget({
    super.key, required this.goalInfo, required this.scale,
  });

  final GoalInfo goalInfo;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 350),
      tween: Tween(begin: scale, end: scale),
      curve: Curves.ease,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: AppColor.blueLinear
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                SvgPicture.asset(goalInfo.imageUrl),
                const SizedBox(height: 30,),
                Text(
                  goalInfo.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColor.white
                  ),
                ),
                const SizedBox(height: 3,),
                const SizedBox(width: 50,
                    child: Divider(color: AppColor.white, thickness: 1.0)
                ),
                const SizedBox(height: 20,),
                Text(
                  goalInfo.description,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}