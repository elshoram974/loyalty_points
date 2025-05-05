import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_assets.dart';

List<String> get imgList => [
      AppAssets.placeholder,
      AppAssets.fullLogo,
      AppAssets.waitingImage,
      AppAssets.trueIcon,
    ];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              color: Colors.green,
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            aspectRatio: 3,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
