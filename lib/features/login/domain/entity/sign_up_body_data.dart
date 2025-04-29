import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/types/account_type.dart';

class SignUpBodyData {
  final PhoneNumber phone;
  final String fullName;
  final String password;
  final String passwordConfirmation;
  final String address;
  final AccountType accountType;
  final XFile profile;
  final List<XFile> attachments;

  SignUpBodyData({
    required this.phone,
    required this.fullName,
    required this.password,
    required this.passwordConfirmation,
    required this.address,
    required this.accountType,
    required this.profile,
    required this.attachments,
  });
}
