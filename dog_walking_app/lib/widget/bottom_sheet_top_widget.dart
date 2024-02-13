import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../model/user_detail_info_model.dart';

class BottomSheetTopWidget extends StatelessWidget {
  const BottomSheetTopWidget({
    super.key,
    required this.data,
  });

  final UerDetailInfo data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 49, right: 65, top: 24),
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
      ),
    );
  }
}