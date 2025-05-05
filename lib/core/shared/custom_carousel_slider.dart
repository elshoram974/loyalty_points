import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/my_network_image.dart';
import '../../../../../core/utils/constants/app_constants.dart';

final ValueNotifier<int> _currentPage = ValueNotifier(0);

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, required this.images, this.onTap});
  final List<String> images;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, _) {
            return InkWell(
              onTap: onTap == null ? null : () => onTap!(index),
              borderRadius: BorderRadius.circular(AppConst.radiusDefault),
              child: MyNetworkImage(
                images[index],
                width: double.maxFinite,
                borderRadius: BorderRadius.circular(AppConst.radiusDefault),
              ),
            );
          },
          options: CarouselOptions(
            /// aspect ratio 3.18 because viewportFraction = 0.94 not equal 1
            /// this make real aspect ratio = 3 : 1
            aspectRatio: 3.18,
            viewportFraction: 0.94,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: AppConst.animationsDefualt,
            autoPlayAnimationDuration: AppConst.autoPlayAnimationDuration,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (value, _) => _currentPage.value = value,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 8,
          child: ListenableBuilder(
              listenable: _currentPage,
              builder: (context, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: images.length,
                  itemBuilder: (context, i) {
                    final bool isSelected = i == _currentPage.value;
                    return AnimatedContainer(
                      duration: AppConst.animationsDefualt,
                      width: isSelected ? 24 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: AppConst.paddingSmall),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
