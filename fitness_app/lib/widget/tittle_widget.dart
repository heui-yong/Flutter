import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

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
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child: SvgPicture.asset("assets/icons/Back-Navs.svg"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => print("디테일!"),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.33, bottom: 3.33),
                child: SvgPicture.asset("assets/icons/Detail-Navs.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}