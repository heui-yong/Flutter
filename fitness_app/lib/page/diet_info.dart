import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class DietInfo extends StatelessWidget {
  final String selectName;

  const DietInfo({
    required this.selectName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("selectName = $selectName");
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 520,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
            )
        ),
        child: Column(
          children: [
            SizedBox(
              width: 50,
              height: 5,
              child: SvgPicture.asset("assets/icons/swap_details.svg"),
            )
          ],
        ),
      ),
    );
  }
}