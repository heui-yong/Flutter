import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwapWidget extends StatelessWidget {
  const SwapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 50,
      height: 5,
      decoration: BoxDecoration(
          color: const Color(0xff1D1617).withOpacity(0.1),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}