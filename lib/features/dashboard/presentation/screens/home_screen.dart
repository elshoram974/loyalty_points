import 'package:flutter/material.dart';

import '../../../../core/shared/custom_carousel_slider.dart';
import '../widgets/home_widgets/font_awasem_icons.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCarouselSlider(images: imgList),
        FontAwasemIcons()
      ],
    );
  }
}

List<String> get imgList => [
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
    ];
