import 'package:equatable/equatable.dart';

class PaginationModel<T extends Equatable> extends Equatable {
  final bool success;
  final List<T> data;
  final int currentPage;
  final int totalItems;

  const PaginationModel({
    this.success = false,
    this.data = const [],
    this.currentPage = 1,
    this.totalItems = 0,
  });

  factory PaginationModel.fromMap(
    Map<String, dynamic> data,
    T Function(Map<String, dynamic>) itemFromMap,
  ) {
    return PaginationModel(
      success: (data['success'] as bool?) ?? false,
      currentPage: (data['data']['current_page'] as int?) ?? 1,
      totalItems: (data['data']['total'] as int?) ?? 0,
      data: (data['data']['data'] as List<dynamic>?)
              ?.map((e) => itemFromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
      // data: (data['data'] as List<dynamic>?)
      //     ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
      //     .toList(),
    );
  }

  // PaginationModel copyWith({
  //   bool? success,
  //   List<T>? data,
  // }) {
  //   return PaginationModel(
  //     success: success ?? this.success,
  //     data: data ?? this.data,
  //   );
  // }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, data, currentPage, totalItems];
}
