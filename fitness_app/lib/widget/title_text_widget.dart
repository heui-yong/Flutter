import 'package:flutter/cupertino.dart';
import '../../../constants/colors.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {

    return Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.black
        )
    );
  }
}
