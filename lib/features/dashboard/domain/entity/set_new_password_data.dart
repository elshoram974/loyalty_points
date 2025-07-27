import 'package:equatable/equatable.dart';

class SetNewPasswordData extends Equatable {
  final String? newPassword;
  final String? confirmPassword;

  const SetNewPasswordData({
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [newPassword, confirmPassword];
}
