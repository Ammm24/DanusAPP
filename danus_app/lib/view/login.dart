import 'package:danus_app/base_page.dart';
import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/config/pref.dart';
import 'package:danus_app/view/regist.dart';
import 'package:danus_app/viewmodel/auth_viewmodel.dart';
import 'package:danus_app/widget/flutter_toast.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Hello There!',
                    style: fontTextStyle.copyWith(
                        color: AppColor.colorPrimary,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Login with your account ',
                    style: fontTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Email',
                    style: fontTextStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email ',
                      hintStyle: fontTextStyle.copyWith(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    style: fontTextStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password ',
                      hintStyle: fontTextStyle.copyWith(color: Colors.black),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 70.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.colorPrimary,
                      ),
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        'Log in',
                        style: fontTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: fontTextStyle.copyWith(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ));
                        },
                        child: Text(
                          'Register Now',
                          style: fontTextStyle.copyWith(
                              color: AppColor.colorPrimary,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    AuthViewmodel()
        .login(email: emailController.text, password: passwordController.text)
        .then((value) async {
      if (value.code == 200) {
        await Session().setUserToken(value.data["access_token"]);
        debugPrint("id user ${value.data["user"]['id']}");
        await Session().setUserId(value.data["user"]['id'].toString());

        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const BasePage()),
            (Route<dynamic> route) => false);
      } else {
        showToast(context: context, msg: value.message);
      }
    });
  }
}
