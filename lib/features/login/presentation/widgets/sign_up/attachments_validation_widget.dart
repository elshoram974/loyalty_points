import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import 'sign_up_buttons.dart';

class AttachmentsValidationWidget extends StatelessWidget {
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
  final void Function(List<XFile?>?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return FormField<List<XFile?>>(
      initialValue: files,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (files) {
        if(files?.isNotEmpty != true || files?.contains(null) == true) return errorMessage;
        return null;
      },
      builder: (state) {
        void onChange(List<XFile?> val){
          state.didChange(val);
          onChanged?.call(val);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppConst.paddingDefault),
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConst.paddingDefault),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppConst.paddingDefault,
              children: List.generate(
                files.length,
                (i) {
                  return Flexible(
                    child: SizedBox.square(
                      dimension: 80,
                      child: InkWell(
                        onTap: onChanged == null 
                        ? null 
                        : () {
                          // List x = List.unmodifiable(elements)
                          onChange(files);
                        },
                        borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                        child: DottedBorder(
                          color: state.hasError && files[i] == null
                            ? context.theme.colorScheme.error 
                            : AppColor.borderColor,
                          strokeWidth: 1,
                          strokeCap: StrokeCap.butt,
                          dashPattern: const [5, 5],
                          padding: EdgeInsets.zero,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(AppConst.radiusSmall),
                          child: files[i] == null 
                          ? const Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined, 
                              size: 32, 
                              color: AppColor.borderColor,
                            ),
                          )
                          : Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                              child: Image.file(
                                File(files[i]!.path), 
                                width: double.infinity, 
                                height: 120, 
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 0, top: 0,
                              child: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(AppConst.paddingSmall),
                                  child: Icon(Icons.delete_forever, color: Colors.red),
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
      }
    );
  }
}