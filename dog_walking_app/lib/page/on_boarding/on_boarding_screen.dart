import 'package:dog_walking_app/page/sign_up/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../widget/numbering_widget.dart';
import '../../widget/orange_btn_widget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  height: MediaQuery.of(context).size.height * 0.75,
                  "assets/images/on_boarding.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: AppColor.onBoardingLinear,
                    stops: [0.1, 0.25, 0.35, 0.45, 0.55, 0.9],
                  ),
                ),
              ),
              const LogoWidget(),
              BottomWidget(size: size)
            ],
          )
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 45, left: 16),
      child: Row(
        children: <Widget>[
          Image(image: AssetImage("assets/images/logo.png"), width: 40, height: 40,),
          SizedBox(width: 2,),
          Text(
            "WOO\nDOG",
            style: TextStyle(
                color: AppColor.red,
                fontSize: 22,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w900,
                height: 1.0,
                letterSpacing: 0
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 57),
      child: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const NumberingWidget(),
            const SizedBox(height: 22,),
            const Text(
              "Too tired to walk your dog?\nLet’s help you!",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 22,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                letterSpacing: -0.41
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22,),
            OrangeBtnWidget(size: size,btnText: "Join our community"),
            const SizedBox(height: 22,),
            RichText(
              text: TextSpan(
                text: "Already a member? ",
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  height: 1,
                  letterSpacing: -0.41
                ),
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: const TextStyle(
                      color: AppColor.orange,
                      fontSize: 13,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -0.41,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}