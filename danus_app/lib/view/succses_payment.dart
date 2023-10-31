import 'package:danus_app/base_page.dart';
import 'package:danus_app/view/home_page.dart';
import 'package:flutter/material.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/ic_avatar.png",
              width: 100,
            ),
            const SizedBox(height: 80),
            const Text(
              'You Order has been accepted',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pembayaran Sedang di cek Verifikasi',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const BasePage()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
