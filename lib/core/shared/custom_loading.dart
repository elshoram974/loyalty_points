import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
    this.ignoreContainers,
  });

  final bool isLoading;
  final bool? ignoreContainers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      justifyMultiLineText: true,
      ignoreContainers: ignoreContainers,
      child: child,
    );
  }
}
