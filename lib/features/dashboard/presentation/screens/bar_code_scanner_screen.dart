
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/utils/constants/app_constants.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  late final MobileScannerController controller;

  @override
  void initState() {
    controller = MobileScannerController(
      autoStart: true,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final double dimensions = 250;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final left = (size.width - dimensions) / 2;
    final top = (size.height - dimensions) / 2;

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            scanWindow: Rect.fromLTWH(left, top, dimensions, dimensions),
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final String? code = barcode.rawValue;
                if (code != null) {
                  controller.stop();
                  Get.back(result: code);
                  break;
                }
              }
            },
          ),

          // ✅ طبقة سوداء شفافة حوالين المربع فقط
          Positioned.fill(
            child: Stack(
              children: [
                // أعلى المربع
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  height: top,
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),

                // أسفل المربع
                Positioned(
                  left: 0,
                  top: top + dimensions,
                  right: 0,
                  bottom: 0,
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),

                // يسار المربع
                Positioned(
                  left: 0,
                  top: top,
                  width: left,
                  height: dimensions,
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),

                // يمين المربع
                Positioned(
                  left: left + dimensions,
                  top: top,
                  right: 0,
                  height: dimensions,
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),

                // ✅ إطار المربع نفسه
                Positioned(
                  left: left,
                  top: top,
                  width: dimensions,
                  height: dimensions,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: context.theme.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
