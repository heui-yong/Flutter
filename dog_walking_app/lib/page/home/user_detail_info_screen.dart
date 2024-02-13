import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../model/user_detail_info_model.dart';
import '../../widget/divider_widget.dart';

class UerDetailInfoScreen extends StatelessWidget {
  final UserInfoDetailModel userInfoDetailModel;
  final String name;

  const UerDetailInfoScreen({super.key, required this.userInfoDetailModel, required this.name});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DraggableScrollableController myScrollController =
    DraggableScrollableController();

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
            myScrollController: myScrollController,
            size: size,
            userInfoDetailModel: userInfoDetailModel,
            name: name,
          ),
        ],
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.myScrollController,
    required this.size,
    required this.userInfoDetailModel,
    required this.name
  });

  final DraggableScrollableController myScrollController;
  final Size size;
  final UserInfoDetailModel userInfoDetailModel;
  final String name;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late Future<UerDetailInfo> uerDetailInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uerDetailInfo = widget.userInfoDetailModel.getUerDetailInfo(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      controller: widget.myScrollController,
      builder: (context, myScrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: Container(
            width: widget.size.width,
            color: AppColor.white,
            child: SingleChildScrollView(
              controller: myScrollController,
              physics: const ClampingScrollPhysics(),
              child: Builder(
                builder: (context) {
                  return FutureBuilder(
                    future: uerDetailInfo,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: BottomSheetTopWidget(data: data),
                              ),
                              DividerWidget(size: widget.size,),
                            ],
                          ),
                        );
                      } else if(snapshot.hasError) {
                        print("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  );
                }
              ),
            ),
          ),
        );
      }
    );
  }
}

class BottomSheetTopWidget extends StatelessWidget {
  const BottomSheetTopWidget({
    super.key,
    required this.data,
  });

  final UerDetailInfo data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 49, right: 65, bottom: 22, top: 24),
      child: Column(
        children: [
          Text(
            data.name,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                    text: data.cost,
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "/hr",
                        style: TextStyle(
                            color: AppColor.searchBarText,
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
              ),
              RichText(
                text: TextSpan(
                  text: data.distance,
                  style: TextStyle(
                      color: AppColor.black,
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " km",
                      style: TextStyle(
                          color: AppColor.searchBarText,
                          fontFamily: "Poppins",
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.scope,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const Icon(Icons.star_purple500_sharp, color: AppColor.searchBarText,size: 13,),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: data.walks,
                  style: TextStyle(
                      color: AppColor.black,
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " walks",
                      style: TextStyle(
                          color: AppColor.searchBarText,
                          fontFamily: "Poppins",
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
