import 'package:dog_walking_app/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../model/user_detail_info_model.dart';
import 'bottom_sheet_top_widget.dart';
import 'divider_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.size,
    required this.userInfoDetailModel,
    required this.name
  });

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
        builder: (context, myScrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Container(
              width: widget.size.width,
              color: AppColor.white,
              child: SingleChildScrollView(
                controller: myScrollController,
                child: FutureBuilder(
                  future: uerDetailInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            BottomSheetTopWidget(data: data),
                            DividerWidget(size: widget.size,),
                            SizedBox(height: 22,),
                            TabWidget()
                          ],
                        ),
                      );
                    } else if(snapshot.hasError) {
                      print("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}