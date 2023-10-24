import 'package:danus_app/config/app_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> userData = [];
  String url = 'https://6536275ac620ba9358ed0b9e.mockapi.io/product';
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      //logic pemanggilan jika berhasil
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        setState(() {
          userData = List<Map<String, dynamic>>.from(response.data);
          print(userData);
        });
      } else {
        print('Gagal mengambil data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: 3 / 2,
                  mainAxisExtent: 180,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8, top: 8),
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 9),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColor.grey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/ic_product.png"),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Indomie",
                              style: fontTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColor.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Rp 4000",
                              style: fontTextStyle.copyWith(
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Stok : 6",
                          style: fontTextStyle.copyWith(
                              color: AppColor.black, fontSize: 9),
                        ),
                      ],
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
}
