import 'package:dog_walking_app/constants/app_color.dart';
import 'package:dog_walking_app/model/home_info_model.dart';
import 'package:dog_walking_app/widget/divider_widget.dart';
import 'package:dog_walking_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widget/user_info_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeInfoModel = HomeInfoModel();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16),
            child: Column(
              children: [
                HomeWidget(size: size),
                const SizedBox(height: 22,),
                const SearchBarWidget(),
                const SizedBox(height: 22,),
                UserInfoWidget(size: size, homeInfoModel: homeInfoModel, userInfoType: "Near you"),
                DividerWidget(size: size),
                UserInfoWidget(size: size, homeInfoModel: homeInfoModel, userInfoType: "Suggested"),
                DividerWidget(size: size),
                UserInfoWidget(size: size, homeInfoModel: homeInfoModel, userInfoType: "Top walkers"),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(title: "Home"),
                Text(
                  "Explore dog walkers",
                  style: TextStyle(
                    color: AppColor.googleBorder,
                    fontFamily: "Poppins",
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.41
                  ),
                ),
              ],
            ),
            Flexible(
              child: TextButton(
                onPressed: () {  },
                child: Container(
                  height: 41,
                  width: 104,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColor.orangeBtnLinear
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Icon(Icons.add,size: 15, color: AppColor.white),
                        ),
                        Text(
                          "Book a walk",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 10,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.41,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.searchBarBg,
            contentPadding: const EdgeInsets.all(12),
            hintText: "Kiyv, Ukraine",
            hintStyle: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: AppColor.searchBarText,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset("assets/images/Iconly_light_location.svg"),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset("assets/images/filter.svg"),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.size,
    required this.homeInfoModel,
    required this.userInfoType,
  });

  final HomeInfoModel homeInfoModel;
  final Size size;
  final String userInfoType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 9.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTextWidget(title: userInfoType),
              TextButton(
                onPressed: (){},
                child: Text(
                  "View all",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColor.black,
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ],
          ),
        ),
        UserInfoListWidget(size: size, homeInfoModel: homeInfoModel, userInfoType: userInfoType),
      ],
    );
  }
}
