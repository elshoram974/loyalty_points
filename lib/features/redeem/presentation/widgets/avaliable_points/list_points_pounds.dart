import 'package:flutter/material.dart';
import 'package:loyalty_points/features/redeem/presentation/widgets/avaliable_points/avaliable_points_container.dart';

import '../../../domain/entities/avaliable_points_entity.dart';

class ListOfPointsAndPounds extends StatefulWidget {
 const  ListOfPointsAndPounds({super.key,});
  @override
  State<ListOfPointsAndPounds> createState() => _ListOfPointsAndPoundsState();
}

class _ListOfPointsAndPoundsState extends State<ListOfPointsAndPounds> {
   int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _avaliablePoints.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AvaliablePointsContainer(
            isSelected: selectedIndex == index,
            avaliablepoints: _avaliablePoints[index],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}

List<AvaliablePointsEntity> get _avaliablePoints => [
      AvaliablePointsEntity(
        points: 540,
        pounds: 100000,
      ),
      AvaliablePointsEntity(
        points: 540,
        pounds: 1000000,
      ),
      AvaliablePointsEntity(
        points: 5000,
        pounds: 1000000,
      ),
       AvaliablePointsEntity(
        points: 5000,
        pounds: 1000000,
      ),
       AvaliablePointsEntity(
        points: 5000,
        pounds: 1000000,
      ),
      
    ];
