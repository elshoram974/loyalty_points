import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/profile_details/profile_details_fields.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).profile,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const ProfileDetails(),
      // bottomNavigationBar: context.isPhone
      //     ? const EditProfileButton(borderRadius: BorderRadius.zero)
      //     : null,
    );
  }
}
