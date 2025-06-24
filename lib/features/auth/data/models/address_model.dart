import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final int id;
  final String name;

  const AddressModel({
    required this.id,
    required this.name,
  });

  factory AddressModel.fromMap(Map json) => AddressModel(
        id: int.parse("${json['id'] ?? -1}"),
        name: json['name'] as String,
      );

  static List<AddressModel> fromMaps(List<Map> data) {
    List<AddressModel> list = [];
    for (Map element in data) {
      list.add(AddressModel.fromMap(element));
    }
    return list;
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  factory AddressModel.empty() {
    return const AddressModel(id: -1, name: 'name');
  }

  @override
  List<Object?> get props {
    return [id, name];
  }
}
