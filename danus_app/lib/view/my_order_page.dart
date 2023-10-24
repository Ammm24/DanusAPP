import 'package:danus_app/config/app_color.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 36),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(9),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.grey)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/ic_product_small.png",
                          width: 95,
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Indomie",
                              style: fontTextStyle.copyWith(
                                fontSize: 22,
                                color: AppColor.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Quantity : 2",
                              style: fontTextStyle.copyWith(
                                fontSize: 12,
                                color: AppColor.lightGrey,
                              ),
                            ),
                            Text(
                              "Indomie",
                              style: fontTextStyle.copyWith(
                                fontSize: 18,
                                color: AppColor.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "Done",
                              style: fontTextStyle.copyWith(
                                fontSize: 12,
                                color: AppColor.colorPrimary,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "23 Juli 2023",
                              style: fontTextStyle.copyWith(
                                fontSize: 12,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
