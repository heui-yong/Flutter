import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_color.dart';
import '../model/home_info_model.dart';
import '../model/user_detail_info_model.dart';
import '../page/home/user_detail_info_screen.dart';

class UserInfoListItemWidget extends StatelessWidget {
  const UserInfoListItemWidget({
    super.key,
    required this.userInfo,
  });

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    void openDietInfoBottomSheet(String name) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(
              CurveTween(
                curve: curve,
              ),
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              UerDetailInfoScreen(
                userInfoDetailModel: UserInfoDetailModel(),
                name: name,
              ),
          fullscreenDialog: false,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        print("${userInfo.name}");
        openDietInfoBottomSheet(userInfo.name);
      },
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  Image.network(
                    userInfo.imageUrl,
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
                          const Icon(Icons.star_purple500_sharp, color: AppColor.scopeText,size: 13,),
                          Text(
                            userInfo.scope,
                            style: const TextStyle(
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
          const SizedBox(height: 10,),
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
                      style: const TextStyle(
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
                        const SizedBox(width: 2,),
                        Text(
                          "${userInfo.distance} from you",
                          style: const TextStyle(
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
                      style: const TextStyle(
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
      ),
    );
  }
}