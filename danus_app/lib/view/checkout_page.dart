import 'package:danus_app/config/app_color.dart';
// import 'package:danus_app/view/kasbon_page.dart';
// import 'package:danus_app/view/payment_page.dart';
import 'package:danus_app/view/upload_bukti_transfer.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage(
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Row(
                          children: [
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
                    "${widget.quantity}",
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
                    "Rp. ${widget.price * widget.quantity}",
                    style: fontTextStyle.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 24),
              InkResponse(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadBuktiTransferPage(
                            image: widget.image,
                            nameProduct: widget.nameProduct,
                            price: widget.price,
                            quantity: widget.quantity,
                            foodId: widget.foodId),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.grey),
                  child: Text(
                    "Pembayaran cash/tunai",
                    style: fontTextStyle.copyWith(),
                  ),
                ),
              ),
              SizedBox(height: 12),
              // ListView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 4,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return InkResponse(
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => UploadBuktiTransferPage(),
              //             ));
              //       },
              //       child: Container(
              //         margin: EdgeInsets.only(bottom: 8),
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(8),
              //             color: AppColor.grey),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Image.asset(
              //               "assets/ic_gopay.png",
              //               width: 32,
              //             ),
              //             Text(
              //               "Gopay",
              //               style: fontTextStyle.copyWith(),
              //             ),
              //             Text(
              //               "0895375873744 a/n reonaldi",
              //               style: fontTextStyle.copyWith(fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
              SizedBox(height: 32),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(45),
                ),
                child: Text(
                  'Kasbon',
                  style: fontTextStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const KasbonPage(),
                  //     ));
                },
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
