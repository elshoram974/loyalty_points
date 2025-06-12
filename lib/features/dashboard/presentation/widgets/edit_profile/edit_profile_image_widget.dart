import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/shared/my_network_image.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/helper/picker_helper.dart';

class EditProfileImageWidget extends StatefulWidget {
  const EditProfileImageWidget({
    super.key,
    this.file,
    this.onChanged,
    this.userImage,
  });
  final String? userImage;
  final XFile? file;
  final void Function(XFile?)? onChanged;

  @override
  State<EditProfileImageWidget> createState() => _EditProfileImageWidgetState();
}

class _EditProfileImageWidgetState extends State<EditProfileImageWidget> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppConst.paddingDefault),
        Text(
          localeLang(context).edit_profile_image,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConst.paddingDefault),
        Center(
          child: SizedBox.square(
            dimension: 80,
            child: InkWell(
              onTap: widget.onChanged == null
                  ? null
                  : () async {
                      final XFile? file = await PickerHelper.getImage();
                      image = file;
                      widget.onChanged?.call(image);
                      setState(() {});
                    },
              borderRadius: BorderRadius.circular(AppConst.radiusSmall),
              child: DottedBorder(
                color: AppColor.borderColor,
                strokeWidth: 1,
                strokeCap: StrokeCap.butt,
                dashPattern: const [5, 5],
                padding: EdgeInsets.zero,
                borderType: BorderType.RRect,
                radius: const Radius.circular(AppConst.radiusSmall),
                child: image == null
                    ? Stack(
                        children: [
                          MyNetworkImage(
                            widget.userImage,
                            height: 200,
                            width: 200,
                            placeHolder: const SizedBox.shrink(),
                          ),
                          const Positioned(
                            right: AppConst.paddingExtraSmall,
                            top: AppConst.paddingExtraSmall,
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              size: 18,
                              color: AppColor.borderColor,
                            ),
                          ),
                        ],
                      )
                    : Stack(children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppConst.radiusSmall),
                          child: Image.file(
                            File(image!.path),
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              image = null;
                              widget.onChanged?.call(image);
                              setState(() {});
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.all(AppConst.paddingExtraSmall),
                              child: Icon(
                                Icons.delete_forever,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
