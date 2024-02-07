import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_color.dart';
import '../model/home_info_model.dart';

class UserInfoListItemWidget extends StatelessWidget {
  const UserInfoListItemWidget({
    super.key,
    required this.userInfo,
  });

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/home_1.png"),
                  width: 180,
                  height: 125,
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 49,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.scopeBg.withOpacity(0.2)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_purple500_sharp, color: AppColor.scopeText,size: 13,),
                        Text(
                          userInfo.scope,
                          style: TextStyle(
                              color: AppColor.scopeText,
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInfo.name,
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/Iconly_light_location.svg",
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "${userInfo.distance} from you",
                        style: TextStyle(
                            color: AppColor.searchBarText,
                            fontSize: 10,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.41
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: 48,
                height: 25,
                decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(7)
                ),
                child: Center(
                  child: Text(
                    "${userInfo.cost}/h",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 10,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}