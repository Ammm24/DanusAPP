import 'dart:io';

import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/config/pref.dart';
import 'package:danus_app/view/succses_payment.dart';
// import 'package:danus_app/view/succses_payment.dart';
import 'package:danus_app/viewmodel/transaction_viewmodel.dart';
import 'package:danus_app/widget/flutter_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadBuktiTransferPage extends StatefulWidget {
  const UploadBuktiTransferPage(
      {super.key,
      this.nameProduct,
      this.price,
      this.quantity,
      this.image,
      this.foodId});
  final dynamic nameProduct;
  final dynamic price;
  final dynamic quantity;
  final dynamic image;
  final dynamic foodId;

  @override
  State<UploadBuktiTransferPage> createState() =>
      _UploadBuktiTransferPageState();
}

class _UploadBuktiTransferPageState extends State<UploadBuktiTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Bukti Transfer"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 32),
              Text(
                "Item Ordered",
                style: fontTextStyle.copyWith(color: AppColor.black),
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            // Image.asset(
                            //   "assets/ic_product_small.png",
                            //   width: 60,
                            // ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "${widget.image}",
                                width: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Center(
                                            child: Text("can't load image"))),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              children: [
                                Text(
                                  "${widget.nameProduct}",
                                  style: fontTextStyle.copyWith(
                                      color: AppColor.black),
                                ),
                                Text(
                                  "Rp. ${widget.price}",
                                  style: fontTextStyle.copyWith(
                                      color: Color(0xFF8D92A3), fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Rp. ${widget.price}",
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
                    "${widget.nameProduct}",
                    style: fontTextStyle.copyWith(color: Color(0xFF8D92A3)),
                  ),
                  Spacer(),
                  Text(
                    "Rp. ${widget.price}",
                    style: fontTextStyle.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Quantity",
                    style: fontTextStyle.copyWith(color: Color(0xFF8D92A3)),
                  ),
                  Spacer(),
                  Text(
                    "Rp. ${widget.quantity}",
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
                    "Rp. ${widget.price * widget.quantity}",
                    style: fontTextStyle.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // Row(
              //   children: [
              //     Text(
              //       "Gopay",
              //       style: fontTextStyle.copyWith(
              //           color: AppColor.black, fontWeight: FontWeight.w700),
              //     ),
              //     Spacer(),
              //     Text(
              //       "0895375873744\n A/N Reonaldi Saputro",
              //       style: fontTextStyle.copyWith(
              //           color: AppColor.black, fontWeight: FontWeight.w700),
              //     ),
              //   ],
              // ),
              SizedBox(height: 24),
              Text(
                "Mohon untuk upload bukti transfer dibawah ini untuk verifikasi status pembayaran, jika pembayaran cash / tunai, mohon foto saat pembayaran tunai kepada pengelola danusan",
                style: fontTextStyle.copyWith(),
              ),
              SizedBox(height: 24),
              DottedBorder(
                color: AppColor.colorPrimary,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 52),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: InkWell(
                      onTap: showOptions,
                      child: Center(
                        child: _image == null
                            ? Column(
                                children: [
                                  // Image.asset("assets/ic_export.png",
                                  //     width: 24),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Upload Gambar",
                                    style: fontTextStyle.copyWith(
                                      color: AppColor.colorPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              )
                            : Image.file(
                                _image!,
                                width: 200,
                              ),
                      ),
                    )),
              ),
              SizedBox(height: 36),
              Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _image != null ? AppColor.colorPrimary : Colors.grey,
                  ),
                  onPressed: () {
                    postCheckout();
                  },
                  child: Text(
                    'Payment Confirm',
                    style: fontTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 46),
            ],
          ),
        ),
      ),
    );
  }

  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Foto Galeri',
              style: fontTextStyle.copyWith(color: AppColor.colorPrimary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Kamera',
              style: fontTextStyle.copyWith(color: AppColor.colorPrimary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  postCheckout() async {
    String? userId = await Session().getUserId();
    if (_image != null) {
      TransactionViewmodel()
          .checkout(
        bukti: _image!,
        foodId: widget.foodId,
        paymentType: "Lunas",
        paymentUrl: "asd",
        qty: widget.quantity,
        status: "Pending",
        total: widget.price * widget.quantity,
        userId: userId,
      )
          .then((value) {
        if (value.message == "Transaction created successfully") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const SuccessPaymentPage()),
              (Route<dynamic> route) => false);
        } else {
          showToast(context: context, msg: value.message.toString());
        }
      });
    }
  }
}
