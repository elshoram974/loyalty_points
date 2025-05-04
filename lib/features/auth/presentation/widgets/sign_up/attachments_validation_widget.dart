import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/helper/picker_helper.dart';
import 'sign_up_buttons.dart';

class AttachmentsValidationWidget extends StatefulWidget {
  const AttachmentsValidationWidget({
    super.key,
    required this.title,
    required this.files,
    this.onChanged,
    this.errorMessage,
  });
  final String title;
  final String? errorMessage;
  final List<XFile?> files;
  final void Function(List<XFile?>)? onChanged;

  @override
  State<AttachmentsValidationWidget> createState() =>
      _AttachmentsValidationWidgetState();
}

class _AttachmentsValidationWidgetState
    extends State<AttachmentsValidationWidget> {
  late List<XFile?> images = List.from(widget.files, growable: false);
  @override
  Widget build(BuildContext context) {
    return FormField<List<XFile?>>(
        initialValue: widget.files,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (files) {
          if (files?.isNotEmpty != true || files?.contains(null) == true)
            return widget.errorMessage;
          return null;
        },
        builder: (state) {
          void onChange(List<XFile?> val) {
            state.didChange(val);
            widget.onChanged?.call(val);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppConst.paddingDefault),
              Text(
                widget.title,
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppConst.paddingDefault),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppConst.paddingDefault,
                children: List.generate(
                  images.length,
                  (i) {
                    return Flexible(
                      child: SizedBox.square(
                        dimension: 80,
                        child: InkWell(
                          onTap: widget.onChanged == null
                              ? null
                              : () async {
                                  final XFile? file =
                                      await PickerHelper.getImage();
                                  images[i] = file;
                                  onChange(images);
                                  setState(() {});
                                },
                          borderRadius:
                              BorderRadius.circular(AppConst.radiusSmall),
                          child: DottedBorder(
                            color: state.hasError && images[i] == null
                                ? context.theme.colorScheme.error
                                : AppColor.borderColor,
                            strokeWidth: 1,
                            strokeCap: StrokeCap.butt,
                            dashPattern: const [5, 5],
                            padding: EdgeInsets.zero,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(AppConst.radiusSmall),
                            child: images[i] == null
                                ? const Center(
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 32,
                                      color: AppColor.borderColor,
                                    ),
                                  )
                                : Stack(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          AppConst.radiusSmall),
                                      child: Image.file(
                                        File(images[i]!.path),
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
                                          images[i] = null;
                                          onChange(images);
                                          setState(() {});
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(
                                              AppConst.paddingExtraSmall),
                                          child: Icon(Icons.delete_forever,
                                              size: 18, color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextErrorIfErrorWidget(state),
            ],
          );
        });
  }
}
