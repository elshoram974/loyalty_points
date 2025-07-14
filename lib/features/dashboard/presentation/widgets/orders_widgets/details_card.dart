import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/extensions/string_ex.dart';

import '../../../../../core/utils/constants/app_constants.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
    this.icon,
    this.valueDirection,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final IconData? icon;
  final TextDirection? valueDirection;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  int? getLengthToLine4;
  int get maxLettersCount => min(getLengthToLine4 ?? 300, 200);
  bool get showSeeMoreButton => widget.value.length > maxLettersCount;

  bool _seeMore = false;
  bool get seeMore => !_seeMore && showSeeMoreButton;

  String get value =>
      seeMore ? widget.value.substring(0, maxLettersCount) : widget.value;

  int? getLengthToLine(int lineNumber) {
    if (!value.contains('\n')) return null;

    List<String> lines = value.split('\n');

    if (lineNumber >= lines.length) return null;

    int length = 0;
    for (int i = 0; i < lineNumber; i++) {
      length += lines[i].trim().length;
    }

    return length;
  }

  @override
  void initState() {
    getLengthToLine4 = getLengthToLine(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppConst.paddingSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusDefault),
      ),
      child: ListTile(
        leading: widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.valueColor ?? Theme.of(context).primaryColor,
              )
            : null,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Align(
          alignment: AlignmentDirectional.centerStart,
          child: RichText(
            textDirection: widget.valueDirection ?? widget.value.direction,
            text: TextSpan(
              style: TextStyle(
                color: widget.valueColor ??
                    Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 16,
              ),
              children: [
                TextSpan(text: value),
                if (showSeeMoreButton) ...[
                  if (!_seeMore) const TextSpan(text: '...'),
                  const TextSpan(text: '   '),
                  TextSpan(
                    text: _seeMore ? 'see less' : 'see more',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => setState(() => _seeMore = !_seeMore),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
