import 'package:flutter/material.dart';
import '../constants/app_color.dart';

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
        onPressed: () {},
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