import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/functions/show_my_dialog.dart';
import '../../../../core/utils/functions/show_my_snack_bar.dart';
import '../../../../core/utils/helper/network_helper.dart';
import '../../../../core/utils/types/account_type.dart';
import '../../data/models/user_model.dart';
import '../../domain/entity/sign_up_body_data.dart';
import '../../domain/repositories/auth_repositories.dart';

abstract class SignUpController extends GetxController {
  SignUpController(this.repo);
  final AuthRepositories repo;

  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  PhoneNumber? phone;
  String fullName = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String address = '';
  String? provider;
  AccountType? accountType;

  XFile? profile;
  List<XFile?> attachments = List.filled(3, null, growable: false);

  Future<void> signUp();

  void changeAccountType(AccountType? type);

  void onPopInvoked();
}

class SignUpControllerImp extends SignUpController {
  SignUpControllerImp(super.repo);

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;


  @override
  Future<void> signUp() async {
     Get.offAllNamed(AppRoute.waiting);
    return;
    if (NetworkInfo.showSnackBarWhenNoInternet) return;

    if (!formKey.currentState!.validate()){ 
      ShowMySnackBar.call(
        localeLang(Get.context!).uHaveToFillFields,
        backgroundColor: Get.theme.colorScheme.error,
      );
      return;
    }
    _isLoading = true;
    update();
    final Status<UserModel> signUpState = await repo.signUp(
      SignUpBodyData(
        phone: phone!,
        fullName: fullName,
        password: password,
        passwordConfirmation: passwordConfirmation,
        address: address,
        accountType: accountType!,
        profile: profile!,
        attachments: attachments.cast<XFile>(),
        email: email,
        provider: provider,
      ),
    );
    handleResponseInController<UserModel>(
      status: signUpState,
      onSuccess: (data) {
        TextInput.finishAutofillContext();
        Get.offAllNamed(AppRoute.home);
      },
    );

    _isLoading = false;
    update();
  }

  @override
  void changeAccountType(AccountType? type) {
    accountType = type;
    update();
  }

  @override
  void onPopInvoked() async {
    if ((phone?.parseNumber().trim() ?? '').isNotEmpty ||
        password.isNotEmpty ||
        passwordConfirmation.isNotEmpty ||
        fullName.isNotEmpty ||
        email.isNotEmpty ||
        provider?.isNotEmpty == true ||
        accountType != null ||
        address.isNotEmpty ||
        profile != null ||
        attachments.any((e) => e != null)) {
      await ShowMyDialog.back(Get.context!);
    } else {
      Get.back();
    }
  }
}
