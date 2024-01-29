import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../model/on_boarding_model.dart';
import 'on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  var onBoardingModel = OnBoardingModel();
  var selectPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      print("selectPage : $selectPage");

      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var onBoardingList = onBoardingModel.getOnBoarding();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) {
              return OnBoardingWidget(onBoarding: onBoardingList[index]);
            },
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: (selectPage+1) / 4,
                    color: AppColor.blue_1,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColor.blueLinear
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.navigate_next),
                    color: AppColor.white,
                    onPressed: () {
                      if(selectPage < onBoardingList.length) {
                        selectPage = selectPage+1;
                        
                        controller.jumpToPage(selectPage);

                        setState(() {

                        });
                      } else {
                        print("object");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
