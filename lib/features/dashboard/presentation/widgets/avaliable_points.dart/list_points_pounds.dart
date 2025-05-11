import 'package:flutter/material.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/avaliable_points.dart/avaliable_points_container.dart';

import '../../../domain/entity/avaliable_points_entity.dart';

class ListOfPointsAndPounds extends StatelessWidget {
  const ListOfPointsAndPounds({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _avaliablePoints.length,
      itemBuilder: (context, index) {
        return AvaliablePointsContainer(
          avaliablepoints: _avaliablePoints[index],
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
    ];
