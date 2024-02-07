import 'package:dog_walking_app/widget/user_info_list_item_widget.dart';
import 'package:flutter/material.dart';
import '../model/home_info_model.dart';

class UserInfoListWidget extends StatefulWidget {
  const UserInfoListWidget({
    super.key,
    required this.size,
    required this.homeInfoModel,
    required this.userInfoType,
  });

  final HomeInfoModel homeInfoModel;
  final Size size;
  final String userInfoType;

  @override
  State<UserInfoListWidget> createState() => _UserInfoListWidgetState();
}

class _UserInfoListWidgetState extends State<UserInfoListWidget> {
  late Future<List<UserInfo>> userList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = switch (widget.userInfoType) {
      "Near you" => widget.homeInfoModel.getNearList(),
      "Suggested" => widget.homeInfoModel.getSuggestedList(),
      "Top walkers" => widget.homeInfoModel.getSuggestedList(),
      _ => widget.homeInfoModel.getNearList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserInfo>>(
      future: userList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
              height: 180,
              width: widget.size.width,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 43,
                ),
                itemBuilder: (context, index) {
                  var userInfo = snapshot.data![index];
                  return UserInfoListItemWidget(userInfo: userInfo);
                },
              )
          );
        } else if(snapshot.hasError) {
          print("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}