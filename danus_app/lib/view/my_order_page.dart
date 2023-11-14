import 'dart:collection';

import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/viewmodel/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  void initState() {
    getAllTransaction();
    super.initState();
  }

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
      body: listTransaction == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 36),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listTransaction?.length,
                      itemBuilder: (context, index) {
                        var data = listTransaction?[index];
                        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                            data?['created_at'] * 1000);
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(9),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.grey)),
                          child: Row(
                            children: [
                              SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data?['food']['name']}",
                                    style: fontTextStyle.copyWith(
                                      fontSize: 22,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Quantity : ${data?['quantity']}",
                                    style: fontTextStyle.copyWith(
                                      fontSize: 12,
                                      color: AppColor.lightGrey,
                                    ),
                                  ),
                                  Text(
                                    "Rp ${data?['total']}",
                                    style: fontTextStyle.copyWith(
                                      fontSize: 18,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(width: 40),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "${data?['status']}",
                                    style: fontTextStyle.copyWith(
                                      fontSize: 12,
                                      color: AppColor.colorPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "${data?['payment_type']}",
                                    style: fontTextStyle.copyWith(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "${DateFormat.yMMMMd('id_ID').format(dateTime)}",
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

  String? foodImage;
  String? nameProduct;
  String? qty;
  String? total;
  String? status;
  String? paymentType;
  List? listTransaction;
  getAllTransaction() {
    TransactionViewmodel().allTransaction().then((value) {
      if (value.code == 200) {
        UnmodifiableListView listData =
            UnmodifiableListView(value.data['data']);
        // debugPrint("ini list $listData");
        setState(() {
          listTransaction = listData.toList();
        });
      } else {
        setState(() {
          listTransaction = [];
        });
      }
    });
  }
}
