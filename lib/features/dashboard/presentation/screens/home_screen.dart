import 'package:flutter/material.dart';

import '../../../../core/shared/custom_carousel_slider.dart';
import '../../../../core/utils/types/social_media_type.dart';
import '../widgets/home_widgets/abusing_code.dart';
import '../widgets/home_widgets/points_balance_widget.dart';
import '../widgets/home_widgets/social_media_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCarouselSlider(images: imgList),
        SocialMediaWidget(items: SocialMediaType.allTypes),
         const PointsBalanceWidget(),
         const AbusingCode()

      ],
    );
  }
}

List<String> get imgList => [
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
      "https://images.playground.com/222e3af2-b63d-4a06-91fb-d015aa7ea48a.jpeg",
    ];
