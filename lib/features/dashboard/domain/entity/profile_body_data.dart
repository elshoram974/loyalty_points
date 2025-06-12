import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';


class ProfileBodyData extends Equatable {
  final String? fullName;
  final String? email;
  final XFile? profile;

  const ProfileBodyData({
    required this.fullName,
    required this.profile,
    required this.email,
  });
  
  @override
  List<Object?> get props => [fullName, email, profile];
}
