import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../model/user_detail_info_model.dart';
import '../../widget/bottom_sheet_top_widget.dart';
import '../../widget/bottom_sheet_widget.dart';
import '../../widget/divider_widget.dart';

class UerDetailInfoScreen extends StatelessWidget {
  final UserInfoDetailModel userInfoDetailModel;
  final String name;

  const UerDetailInfoScreen({super.key, required this.userInfoDetailModel, required this.name});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/alex_murray.png"),
            width: size.width,
            height: size.height*0.6,
            fit: BoxFit.fill,
          ),
          BottomSheetWidget(
            size: size,
            userInfoDetailModel: userInfoDetailModel,
            name: name,
          ),
        ],
      ),
    );
  }
}


