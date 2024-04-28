// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rusconsign/homePage/home_page_controller.dart';
import 'package:rusconsign/homePage/widgets/filter_button.dart';
import 'package:rusconsign/homePage/widgets/product_card.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/text_style.dart';

class HomePage extends StatelessWidget {
  final indicator = Get.put(HomePageController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 28,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.messageCircle,
                        color: Color(0xFF222831),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Halo Username',
                      style: AppTextStyle().header(AppColors.titleLine),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              focusColor: const Color(0xFFF5F5F5),
                              hintText: 'Cari jasa atau produk...',
                              hintStyle: const TextStyle(
                                color: Color(0xFF30475E),
                              ),
                            ),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF30475E),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FeatherIcons.search,
                                color: Color(0xFF222831),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              CarouselSlider(
                items: [
                  'assets/images/item_carousel_1.png',
                  'assets/images/item_carousel_2.png',
                ].map((item) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed("/diskonpage");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 160,
                  enlargeFactor: 0.25,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    indicator.updateCurrentIndexIndicator(index);
                  },
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (indicator.currentIndex == index)
                              ? const Color(0xFFFF3D3D)
                              : const Color(0xFFF5F5F5),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halaman Produk dan Jasa',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF222831),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterButton(
                          text: 'Semua',
                          icon: FeatherIcons.alignJustify,
                          index: 0,
                        ),
                        Spacer(),
                        FilterButton(
                          text: 'Jasa',
                          icon: FeatherIcons.users,
                          index: 1,
                        ),
                        Spacer(),
                        FilterButton(
                          text: 'Produk',
                          icon: FeatherIcons.box,
                          index: 2,
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                            imagePath: 'https://via.placeholder.com/165x110',
                            title: 'Productdamndmajdnjandujamudamjudiadiaidaidmiawmdiawmddnawudnuadn',
                            price: 12000,
                            rating: (index % 5) + 1,
                          );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
