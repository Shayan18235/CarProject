// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carapi/colors.dart';
import 'package:carapi/information/detail_build.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/login_screen.dart';

class detailPageOne extends StatefulWidget {
  detailPageOne({super.key});

  @override
  State<detailPageOne> createState() => _detailPageOneState();
}

class _detailPageOneState extends State<detailPageOne> {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe(
          liquidController: controller,
          enableSideReveal: true,
          fullTransitionValue: 800,
          slideIconWidget: Icon(Icons.arrow_back_ios_new),
          enableLoop: false,
          onPageChangeCallback: (activePageIndex) {
            setState(() {});
          },
          pages: [
            detailBuilde(
                color: Colors.black,
                image: 'assets/images/detail1.png',
                title: 'خـزمـەت گـوزاریـەکـان',
                subtitle: 'دۆزینەوەی سەنتەری خزمەتگوزاری گونجاو بۆ پێداویستییە تایبەتەکانی ئۆتۆمبێلەکەت'),
            detailBuilde(
                color: ColorStyle.beige,
                image: 'assets/images/detail2.png',
                title: 'مامەڵە و داشکاندنی تایبەت',
                subtitle: 'پێشکەشکارانی خزمەتگوزاری ئۆتۆمبێل داشکاندن و بانگەشە تایبەتەکان بە تایبەتی لە ڕێگەی ئەپی خزمەتگوزاری ئۆتۆمبێلەوە پێشکەش دەکەن'),
            detailBuilde(
                color: ColorStyle.grey,
                image: 'assets/images/details3.png',
                title: 'ئـاگـاداریـیەکـان',
                subtitle: 'لـەڕێگـەی ئـەم ئـەپـەوە لـەکـاتی خـۆیـدا ئـاگـاداریـت پـێـدەگـات سـەبـارەت بـە خزمـەت گـوزاری داهـاتووی ئـۆتـۆمبـێـلـەکـەت'),
          ],
        ),
        Positioned(
          bottom: 30,
          left: 16,
          right: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.jumpToPage(page: 2);
                },
                child: Text(
                  'تێپەڕاندن',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'kurdish_bold'),
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: WormEffect(spacing: 16, dotColor: Colors.white54, activeDotColor: Colors.white),
                onDotClicked: (index) {
                  controller.animateToPage(page: index);
                },
              ),
              TextButton(
                onPressed: () {
                  final page = controller.currentPage + 1;
                  // controller.animateToPage(page: page > 3 ? 0 : page, duration: 500);
                  if (page >= 3) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  } else {
                    controller.animateToPage(
                      page: page,
                    );
                  }
                },
                child: Builder(
                  builder: (BuildContext context) {
                    final page = controller.currentPage;
                    return Text(
                      page >= 2 ? 'دەستپێکردن' : 'دواتـر',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'kurdish_bold'),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
