import 'package:danus_app/base_page.dart';
import 'package:danus_app/view/login.dart';
import 'package:danus_app/viewmodel/auth_viewmodel.dart';
import 'package:danus_app/widget/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? passwordMatch;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      namaController = TextEditingController(),
      noHpController = TextEditingController(),
      passwordConfirmController = TextEditingController(),
      nrpController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nrpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Let\'s Get Started',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'Create Your Account',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nrpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'NRP',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: noHpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Nomor HP',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordConfirmController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password Confirm',
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Konfirmasi Kata Sandi harus di isi';
                    //   }
                    //   if (value != passwordMatch) {
                    //     return 'Kedua kata sandi harus sama';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        debugPrint(namaController.text);
                        debugPrint(nrpController.text);
                        debugPrint(emailController.text);
                        debugPrint(noHpController.text);
                        debugPrint(passwordController.text);
                        debugPrint(passwordConfirmController.text);
                        if (_formKey.currentState!.validate()) {
                          AuthViewmodel()
                              .register(
                            nrp: nrpController.text,
                            name: namaController.text,
                            email: emailController.text,
                            phone: noHpController.text,
                            password: passwordController.text,
                            confirmPassword: passwordConfirmController.text,
                          )
                              .then(
                            (response) {
                              if (response.code == 200) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const BasePage()),
                                    (Route<dynamic> route) => false);
                              } else {
                                showToast(
                                    context: context,
                                    msg: response.message.toString());
                              }
                            },
                          );
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const LoginPage(),
                        //     ));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )))),
    ));
  }
}
