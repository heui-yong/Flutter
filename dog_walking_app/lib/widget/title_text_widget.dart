import 'package:flutter/cupertino.dart';

import '../constants/app_color.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 34,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        letterSpacing: -0.41,
      ),
    );
  }
}