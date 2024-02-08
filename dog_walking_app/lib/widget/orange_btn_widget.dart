import 'package:dog_walking_app/model/home_info_model.dart';
import 'package:dog_walking_app/services/api_service.dart';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../page/home/home_main_screen.dart';

class OrangeBtnWidget extends StatelessWidget {
  const OrangeBtnWidget({
    super.key,
    required this.size,
    required this.btnText,
  });

  final Size size;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMainScreen()));
        },
        child: Container(
          width: size.width,
          height: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: AppColor.orangeBtnLinear
              ),
              borderRadius: BorderRadius.circular(14)
          ),
          child: Text(
            btnText,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColor.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}