import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/profile_details_fields.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../auth/data/models/user_model.dart';
import '../widgets/edit_profile/edit_profile_button.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).edit_your_profile,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingBig),
        children: [
          const ProfileDetails(),
          if (!context.isPhone) const EditProfileButton(),
        ],
      ),
      bottomNavigationBar: context.isPhone
          ? const EditProfileButton(borderRadius: BorderRadius.zero)
          : null,
    );
  }
}
