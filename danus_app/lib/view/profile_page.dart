import 'package:danus_app/base_page.dart';
import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/config/pref.dart';
import 'package:danus_app/viewmodel/auth_viewmodel.dart';
import 'package:danus_app/viewmodel/user_viewmodel.dart';
import 'package:danus_app/widget/flutter_toast.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset("assets/ic_avatar.png"),
                  const SizedBox(height: 36),
                  Text(
                    name ?? "",
                    style: fontTextStyle.copyWith(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    nrp ?? "",
                    style: fontTextStyle.copyWith(
                      fontSize: 12,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    email ?? "",
                    style: fontTextStyle.copyWith(
                      fontSize: 12,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppColor.grey,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const EditPage(),
                  //           ));
                  //     },
                  //     child: Text(
                  //       "Edit Profile",
                  //       style: fontTextStyle.copyWith(
                  //         fontSize: 12,
                  //         color: AppColor.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 28),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppColor.grey,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const ChangePasswordPage(),
                  //           ));
                  //     },
                  //     child: Text(
                  //       "Change Password",
                  //       style: fontTextStyle.copyWith(
                  //         fontSize: 12,
                  //         color: AppColor.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.grey,
                      ),
                      onPressed: () {
                        AuthViewmodel().logout().then((value) async {
                          if (value.code == 200) {
                            await Session().logout();
                            if (!mounted) return;
                            showToast(context: context, msg: "Logout Berhasil");
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (_) => const BasePage()),
                                (Route<dynamic> route) => false);
                          } else {
                            showToast(
                                context: context, msg: "Terjadi Kesalahan");
                          }
                        });
                      },
                      child: Text(
                        "Log Out",
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

  String? name;
  String? nrp;
  String? email;
  bool loading = true;
  getUser() async {
    String? token = await Session().getUserToken();
    if (token != null) {
      UserViewmodel().userDetail().then((value) async {
        if (value.code == 200) {
          setState(() {
            loading = false;
            name = value.data['name'];
            nrp = value.data['nrp'];
            email = value.data['email'];
          });
        } else if (value.code == 401) {
          setState(() {
            loading = false;
          });

          await Session().logout();
          if (!mounted) return;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const BasePage()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            loading = false;
          });
        }
      });
    }
  }
}
