import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = false;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Shimmer.fromColors(
          baseColor: themeProvider == true
              ? AppColors.greyShade900
              : Colors.grey.shade200,
          highlightColor: themeProvider == true
              ? Colors.grey.shade800
              : Colors.grey.shade300,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 2),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: size.width * 0.45,
                                height: size.height * 0.20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      color: Colors.white,
                                      width: size.width * 0.45,
                                      height: 15),
                                  const SizedBox(height: 10),
                                  Container(
                                      color: Colors.white,
                                      width: size.width * 0.22,
                                      height: 15),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    );
                  })))),
    );
  }
}
