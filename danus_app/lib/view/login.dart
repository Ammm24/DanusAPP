import 'package:danus_app/base_page.dart';
import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/view/regist.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                const SizedBox(height: 50),
                Text(
                  'Email',
                  style: fontTextStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Password',
                  style: fontTextStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan password ',
                    hintStyle: fontTextStyle.copyWith(color: Colors.black),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 70.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.colorPrimary,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BasePage(),
                          ));
                    },
                    child: Text(
                      'Log in',
                      style: fontTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
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
    );
  }
}
