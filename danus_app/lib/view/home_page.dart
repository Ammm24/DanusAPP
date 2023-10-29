import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/model/list_product.dart';
import 'package:danus_app/view/detail_product_page.dart';
import 'package:danus_app/viewmodel/product_viewmodel.dart';
import 'package:danus_app/widget/flutter_toast.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
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
      body: _listProduct == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 3 / 2,
                        mainAxisExtent: 180,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var listProduct = _listProduct?.data?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailProductPage(id: listProduct?.id),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 8, top: 8),
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 9),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.grey,
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/ic_product.png"),
                                // Image.network(
                                //   "${listProduct?.picturePath}",
                                //   width: 154,
                                //   fit: BoxFit.cover,
                                // ),
                                const SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text(
                                      "${listProduct?.name}",
                                      style: fontTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Rp ${listProduct?.price}",
                                      style: fontTextStyle.copyWith(
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Stok : ${listProduct?.stok}",
                                  style: fontTextStyle.copyWith(
                                      color: AppColor.black, fontSize: 9),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  ListProduct? _listProduct;
  getListProduct() {
    ProductViewmodel().listProduct().then((value) {
      if (value.code == 200) {
        setState(() {
          _listProduct = ListProduct.fromJson(value.data);
        });
      } else {
        showToast(context: context, msg: value.message);
      }
    });
  }
}
