import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/view/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: Image.asset(
          "assets/logo_danus.png",
          width: 200,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset("assets/ic_avatar.png"),
            const SizedBox(height: 36),
            Text(
              "Jennifer",
              style: fontTextStyle.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "087817180239",
              style: fontTextStyle.copyWith(
                fontSize: 12,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "jennifer@gmail.com",
              style: fontTextStyle.copyWith(
                fontSize: 12,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.grey,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: Text(
                  "Logout",
                  style: fontTextStyle.copyWith(
                    fontSize: 12,
                    color: AppColor.black,
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
