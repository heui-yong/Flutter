import 'package:flutter/cupertino.dart';
import '../constants/app_color.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 14, right: 16),
      child: Container(
        width: size.width,
        height: 1,
        decoration: const BoxDecoration(
            color: AppColor.dividerColor
        ),
      ),
    );
  }
}