import 'package:equatable/equatable.dart';

class AvaliablePointsEntity extends Equatable {
  final double points;
  final double pounds;

  const AvaliablePointsEntity({
    required this.pounds,
    required this.points,
  });
  @override
  List<Object?> get props => [points, pounds];
}
