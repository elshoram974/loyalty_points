class LoginRequestData {
  final String emailOrPhone;
  final String password;
  final String loginBy;

  LoginRequestData({
    required this.loginBy,
    required this.emailOrPhone,
    required this.password,
  });
}
