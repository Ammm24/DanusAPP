import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/model/data_product.dart';
import 'package:danus_app/view/checkout_page.dart';
import 'package:danus_app/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key, this.id});
  final dynamic id;

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  int _counter = 0;

  @override
  void initState() {
    getDetailProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _dataProduct == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    // Image.asset("assets/ic_product.png"),
                    SizedBox(height: 12),
                    Image.network(
                      "https://www.danusanhmif.store/storage/${_dataProduct?.picturePath}",
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) => SizedBox(
                          height: 146,
                          width: double.infinity,
                          child: Center(child: Text("can't load image"))),
                    ),
                    Container(
                      height: 500,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              "${_dataProduct?.name}",
                              style: fontTextStyle.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Stok ${_dataProduct?.stok}",
                              style: fontTextStyle.copyWith(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Product Detail",
                                style: fontTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.colorPrimary,
                                ),
                              ),
                            ),
                            Text(
                              "${_dataProduct?.description}",
                              style: fontTextStyle.copyWith(
                                color: AppColor.black,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 102),
                            Row(
                              children: [
                                Text(
                                  "Rp ${_dataProduct?.price}",
                                  style: fontTextStyle.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _decrementCounter();
                                        },
                                        icon: Image.asset(
                                            _counter >= 1
                                                ? "assets/button_min_dark.png"
                                                : "assets/button_min.png",
                                            width: 28)),
                                    Text(
                                      "$_counter",
                                      style: fontTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF252A31),
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _incrementCounter();
                                        },
                                        icon: Image.asset(
                                            "assets/button_plus.png",
                                            width: 28)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _counter > 0
                                      ? AppColor.colorPrimary
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  _counter > 0
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CheckOutPage(
                                              image:
                                                  "https://www.danusanhmif.store/storage/${_dataProduct?.picturePath}",
                                              nameProduct: _dataProduct?.name,
                                              price: _dataProduct?.price,
                                              quantity: _counter,
                                              foodId: _dataProduct?.id,
                                            ),
                                          ))
                                      : null;
                                },
                                child: Text(
                                  'Checkout',
                                  style: fontTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  DataProduct? _dataProduct;
  getDetailProduct() {
    ProductViewmodel().detailProduct(id: widget.id).then((value) {
      if (value.code == 200) {
        setState(() {
          _dataProduct = DataProduct.fromJson(value.data);
        });
      }
    });
  }
}
