import 'package:equatable/equatable.dart';

class SetNewPasswordData extends Equatable {
  final String mobile;          
  final String otp;                 
  final String password;            
  final String? confirmPassword; 
  const SetNewPasswordData({
    required this.mobile,
    required this.otp,
    required this.password,
    this.confirmPassword,
  });

  @override
  List<Object?> get props => [mobile, otp, password, confirmPassword];
}