import 'package:danus_app/config/app_color.dart';
import 'package:danus_app/provider/product_provider.dart';
import 'package:danus_app/view/detail_product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          if (productProvider.productData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var listProduct0 = productProvider.productData;

            debugPrint("listproduct ${listProduct0?.data["data"].length}");

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listProduct0?.data["data"].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 180,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var listProduct = listProduct0?.data?["data"][index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProductPage(
                                  id: listProduct?["id"],
                                ),
                              ),
                            );
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
                                    0,
                                    1,
                                  ),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    "https://www.danusanhmif.store/storage/${listProduct?["picturePath"]}",
                                    width: 154,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const SizedBox(
                                      height: 82,
                                      width: double.infinity,
                                      child: Center(
                                          child: Text("can't load image")),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      "${listProduct?["name"]}",
                                      style: fontTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Rp ${listProduct?["price"]}",
                                      style: fontTextStyle.copyWith(
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Stok : ${listProduct?["stok"]}",
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
            );
          }
        },
      ),
    );
  }
}
