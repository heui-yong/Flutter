import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../model/user_detail_info_model.dart';
import '../../widget/bottom_sheet_widget.dart';

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
            height: size.height*0.5,
            fit: BoxFit.fill,
          ),
          AppBarWidget(),
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

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  var _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColor.color_c4c4c4.withOpacity(0.4),
                  shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.close_rounded, size: 15, color: AppColor.white,
                ),
              ),
            ),
            Container(
              height: 44,
              decoration: BoxDecoration(
                  color: AppColor.color_c4c4c4.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      "Verified",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 13,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isCheck = !_isCheck;
                        });
                      },
                      child: _isCheck
                          ? Icon(
                        Icons.check_box_rounded,
                        size: 20.0,
                        color: Colors.white,
                      )
                          : Icon(
                        Icons.check_box_outline_blank_rounded,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


