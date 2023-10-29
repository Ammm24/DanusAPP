import 'package:danus_app/config/app_color.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 24),
              Text(
                "Item Ordered",
                style: fontTextStyle.copyWith(color: AppColor.black),
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/ic_product_small.png",
                              width: 60,
                            ),
                            SizedBox(width: 12),
                            Column(
                              children: [
                                Text(
                                  "Indomie",
                                  style: fontTextStyle.copyWith(
                                      color: AppColor.black),
                                ),
                                Text(
                                  "Rp. 8000",
                                  style: fontTextStyle.copyWith(
                                      color: Color(0xFF8D92A3), fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Rp. 8000",
                          style: fontTextStyle.copyWith(
                              color: Color(0xFF8D92A3), fontSize: 13),
                        )
                      ],
                    ),
                  );
                },
              ),
              Text(
                "Detail Transaction",
                style: fontTextStyle.copyWith(color: AppColor.black),
              ),
              Row(
                children: [
                  Text(
                    "Indomie",
                    style: fontTextStyle.copyWith(color: Color(0xFF8D92A3)),
                  ),
                  Spacer(),
                  Text(
                    "Rp. 8000",
                    style: fontTextStyle.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Indomie",
                    style: fontTextStyle.copyWith(color: Color(0xFF8D92A3)),
                  ),
                  Spacer(),
                  Text(
                    "Rp. 8000",
                    style: fontTextStyle.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              SizedBox(height: 42),
              Row(
                children: [
                  Text(
                    "Total Price",
                    style: fontTextStyle.copyWith(color: Color(0xFF8D92A3)),
                  ),
                  Spacer(),
                  Text(
                    "Rp. 8000",
                    style: fontTextStyle.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              SizedBox(height: 92),
              Row(
                children: [
                  Text(
                    "Total Payment",
                    style: fontTextStyle.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Rp. 8000",
                    style: fontTextStyle.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
