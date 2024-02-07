import 'package:dog_walking_app/constants/app_color.dart';
import 'package:dog_walking_app/model/home_info_model.dart';
import 'package:dog_walking_app/services/api_service.dart';
import 'package:dog_walking_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<UserInfo>>nearList;
  var homeInfoModel = HomeInfoModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nearList = homeInfoModel.getNearList();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16),
          child: Column(
            children: [
              HomeWidget(size: size),
              const SizedBox(height: 22,),
              const SearchBarWidget(),
              const SizedBox(height: 22,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 9.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TitleTextWidget(title: "Near you"),
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
                  FutureBuilder<List<UserInfo>>(
                    future: nearList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 180,
                          width: size.width,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 43,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Stack(
                                      children: [
                                        Image(image: AssetImage("assets/images/home_1.png"),),
                                        Positioned(
                                          child: Container(
                                            width: 49,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                color: AppColor.scopeBg.withOpacity(0.2)
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(Icons.star_purple500_sharp, color: AppColor.scopeText,size: 15,),
                                                Text("data")
                                              ],
                                            ),
                                          ),
                                          right: 10,
                                          top: 10,
                                        ),
                                      ],
                                    )
                                  ),
                                ],
                              );
                            },
                          )
                        );
                      } else if(snapshot.hasError) {
                        print("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              )
            ],
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
