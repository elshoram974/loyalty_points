import 'package:equatable/equatable.dart';

class UpdatePasswordData extends Equatable {
  final String? currentPassword;
  final String? newPassword;
  final String? confirmPassword;

  const UpdatePasswordData({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword, confirmPassword];
}
