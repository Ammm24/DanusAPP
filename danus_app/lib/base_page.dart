import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/config/pref.dart';
import 'package:danus_app/view/home_page.dart';
import 'package:danus_app/view/login.dart';
import 'package:danus_app/view/my_order_page.dart';
import 'package:danus_app/view/profile_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final Session _session = Session();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MyOrderPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: _session.getUserToken(),
        builder: (_, snapshot) {
          if (snapshot.data == null) return const LoginPage();
          return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: fontTextStyle.copyWith(
                  color: AppColor.colorPrimary, fontSize: 10),
              unselectedLabelStyle: fontTextStyle.copyWith(
                  color: AppColor.lightGrey, fontSize: 10),
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic_home.png",
                    width: 20,
                    color: _selectedIndex == 0
                        ? AppColor.colorPrimary
                        : AppColor.lightGrey,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic_order.png",
                    width: 20,
                    color: _selectedIndex == 1
                        ? AppColor.colorPrimary
                        : AppColor.lightGrey,
                  ),
                  label: "My Order",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic_profile.png",
                    width: 20,
                    color: _selectedIndex == 2
                        ? AppColor.colorPrimary
                        : AppColor.lightGrey,
                  ),
                  label: "Profile",
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
