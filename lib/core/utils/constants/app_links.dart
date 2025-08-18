abstract final class AppLinks {
  const AppLinks();

  static const String login = '/api/auth/login';
  static const String signUp = '/api/auth/register';
  static const String providersList = '/api/providers/list';
  static const String countriesList = '/api/addresses/countries';
  static const String governoratesList = '/api/addresses/states';
  static const String areasList = '/api/addresses/areas';

  static const String updateFCMToken = '/api/update-fcm-token';

  static const String user = '/api/user';
  static const String pointsHistory = '/api/customer/transactions';
  static const String ordersHistory = '/api/customer/redeem-requests';

  static const String createRedeem = '/api/redeem/create';
  static const String scanCode = '/api/scan';

  static const String config = '/api/config';
  static const String updateProfile = '/api/customer/profile/update';
  static const String updatePassword = '/api/customer/update-password';
  static const String sendCode    = '/api/auth/forgot/send-otp';   
  static const String checkCode   = '/api/auth/forgot/verify-otp'; 
  static const String newPassword = '/api/auth/forgot/reset-password' ;
}
