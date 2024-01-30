import 'package:fitness_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'on_boarding_screen.dart';

class FitNestXStart extends StatefulWidget {
  const FitNestXStart({super.key});

  @override
  State<FitNestXStart> createState() => _FitNestXStartState();
}

class _FitNestXStartState extends State<FitNestXStart> {
  var _hoverIndex = false;
  
  void _moveOnBoardingScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: _hoverIndex ? const LinearGradient(
            colors: AppColor.blueLinear
          ): null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: "Fitnest",
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "X",
                        style: TextStyle(
                          color: _hoverIndex ? Colors.white : Color(0xffCC8FED),
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                  ),
                ),
                const Text(
                  "Everybody Can Train",
                  style: TextStyle(
                    color: AppColor.gray_1,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30, bottom: 40),
                    child: MouseRegion(
                      onEnter: (event) => setState(() {
                        _hoverIndex = true;
                      }),
                      onExit: (event) => setState(() {
                        _hoverIndex = false;
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: _hoverIndex ? [Colors.white, Colors.white] : AppColor.blueLinear
                            ),
                            borderRadius: BorderRadius.circular(99)
                        ),
                        child: TextButton(
                          onPressed: () {
                            print("moveOnBoardingScreen");
                            _moveOnBoardingScreen();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18, top: 18),
                            child: GradientText(
                              "Get Started",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: _hoverIndex ? AppColor.blueLinear : [Colors.white, Colors.white],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
