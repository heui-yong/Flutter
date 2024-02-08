import 'package:dog_walking_app/page/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int _pageIndex = 0;
  final List<Widget> _page = <Widget>[
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  _setSelectedColor(int index) {
    return index == _pageIndex ? AppColor.black : AppColor.hintText;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: _page.elementAt(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: _setSelectedColor(0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt, color: _setSelectedColor(1)),
            label: 'Moments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: _setSelectedColor(2)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _setSelectedColor(3)),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: AppColor.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
