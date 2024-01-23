import 'package:fitness_app/model/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DietInfo extends StatelessWidget {
  final Diet diet;

  const DietInfo({
    required this.diet,
    Key? key,
  }) : super(key: key);

  static const colors = {
    "0xff9DCEFF": [Color(0xff9DCEFF), Color(0xff92A3FD)],
    "0xffEEA4CE": [Color(0xffEEA4CE), Color(0xffC58BF2)],
  };

  setViewBtnColor(String boxColor) {
    return colors[boxColor] ?? [const Color(0xff9DCEFF), const Color(0xff92A3FD)];
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: setViewBtnColor(diet.boxColor),
          ),
        ),
        child: Column(
          children: <Widget>[
            const TittleWidget(),
            const SizedBox(height: 50,),
            BackImageWidget(diet: diet),
          ],
        ),
      ),
    );
  }
}

class TittleWidget extends StatelessWidget {
  const TittleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child:
                SvgPicture.asset("assets/icons/Back-Navs.svg"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => "디테일!",
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child:
                SvgPicture.asset("assets/icons/Detail-Navs.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackImageWidget extends StatelessWidget {
  const BackImageWidget({
    super.key,
    required this.diet,
  });

  final Diet diet;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44),
                  child: Container(
                    width: double.infinity,
                    height: 288,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44),
                  child: Container(
                    width: double.infinity,
                    height: 288,
                    child: SvgPicture.asset(diet.imageUrl),
                  ),
                ),
              ],
            ),
          ),
          BottomContentWidget(diet: diet),
        ],
      ),
    );
  }
}

class BottomContentWidget extends StatelessWidget {
  final Diet diet;

  const BottomContentWidget({
    super.key,
    required this.diet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xff1D1617).withOpacity(0.1)
                ),
              ),
              SizedBox(height: 25,),
              Row(
               children: [
                 Column(
                   children: [
                     Text(
                       diet.name,
                       style: TextStyle(
                         fontWeight: FontWeight.w700,
                         fontSize: 16,
                         color: Colors.black
                       ),
                     ),
                     SizedBox(height: 30,),
                     //todo!!
                   ],
                 ),
               ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
