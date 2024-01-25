import '../constants/colors.dart';

class ColorUtil {

  static setViewLinearColor(String boxColor) {
    return switch(boxColor) {
      "0xff9DCEFF" => AppColor.blueLinear,
      "0xffEEA4CE" => AppColor.purpleLinear,
      _ => AppColor.blueLinear,
    };
  }
}