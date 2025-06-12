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
            dimension: 200,
            child: InkWell(
              onTap: widget.onChanged == null
                  ? null
                  : () async {
                      final XFile? file = await PickerHelper.getImage();
                      image = file;
                      widget.onChanged?.call(image);
                      setState(() {});
                    },
              borderRadius: BorderRadius.circular(500),
              child: DottedBorder(
                color: AppColor.borderColor,
                strokeWidth: 1,
                strokeCap: StrokeCap.butt,
                dashPattern: const [5, 5],
                padding: EdgeInsets.zero,
                borderType: BorderType.Circle,
                child: image == null
                    ? Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Hero(
                            tag: widget.userImage ?? 'user image',
                            child: MyNetworkImage(
                              widget.userImage,
                              placeHolder: const SizedBox.shrink(),
                              borderRadius: BorderRadius.circular(500),
                            ),
                          ),
                          const Positioned(
                            right: AppConst.paddingExtraBig,
                            top: AppConst.paddingExtraBig,
                            child: Icon(
                              FontAwesomeIcons.penToSquare,
                              size: 18,
                              color: AppColor.borderColor,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.file(
                              File(image!.path),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: AppConst.paddingExtraBig,
                            top: AppConst.paddingExtraBig,
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
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
