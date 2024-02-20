import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../model/user_detail_info_model.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.data,
  });

  final UerDetailInfo data;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> with TickerProviderStateMixin {
  late TabController _myController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myController = TabController(vsync: this, length: 3);
  }

  final List _tabName = [
    "About",
    "Location",
    "Reviews"
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _tabName.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                      _myController.index = index;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 44,
                    margin: EdgeInsets.only(right: 48),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: current == index ? AppColor.black : AppColor.btnBg,
                        borderRadius: BorderRadius.circular(14)
                    ),
                    child: Text(
                      _tabName[index],
                      style: TextStyle(
                        color: AppColor.googleBorder,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _myController,
              children: [
                TabAboutWidget(data: widget.data,),
                Text("2222222"),
                Text("3333333"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabAboutWidget extends StatelessWidget {
  const TabAboutWidget({super.key, required this.data,});

  final UerDetailInfo data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(
                      color: AppColor.googleBorder,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    "${data.about["age"]}",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 17
                    ),
                  ),
                ],
              ),
              SizedBox(width: 45,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Experience",
                    style: TextStyle(
                      color: AppColor.googleBorder,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    "${data.about["experience"]}",
                    style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontSize: 17
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22,),

        ],
      ),
    );
  }
}
