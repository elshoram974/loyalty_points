import 'package:flutter/material.dart';

class OpenLocationWarning extends StatelessWidget {
  const OpenLocationWarning(
      {super.key,
      required this.title,
      required this.body,
      this.onPressCancel,
      this.onPressConfirm,
      this.textCancel,
      this.textOpenSetting});
  final String title;
  final String body;
  final void Function()? onPressCancel;
  final void Function()? onPressConfirm;
  final String? textCancel;
  final String? textOpenSetting;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Row(
        children: [
          const Icon(Icons.location_off, color: Colors.red),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        body,
        textAlign: TextAlign.right,
      ),
      actions: [
        TextButton(
          onPressed: onPressCancel,
          child: Text(textCancel!),
        ),
        ElevatedButton(
          onPressed: onPressConfirm,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(textOpenSetting!),
        ),
      ],
    );
  }
}
