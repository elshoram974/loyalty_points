import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../utils/config/locale/local_lang.dart';
import '../utils/constants/app_constants.dart';
import '../utils/helper/my_text_decoration.dart';

class CustomDropDownButton<T> extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    this.hint,
    required this.items,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.errorMessage,
    this.enabled = true,
    this.readOnly = false,
    this.autofillHints,
  });
  final bool enabled;
  final bool readOnly;
  final String? hint;
  final String? errorMessage;
  final List<T> items;
  final IconData? prefixIcon;
  final Iterable<String>? autofillHints;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  @override
  State<CustomDropDownButton<T>> createState() =>
      _CustomDropDownButtonState<T>();
}

class _CustomDropDownButtonState<T> extends State<CustomDropDownButton<T>> {
  final TextEditingController _controller = TextEditingController();

  T? selectedValue;
  final Debouncer debounce = Debouncer(
    delay: const Duration(milliseconds: AppConst.debounceMilliseconds),
  );

  List<T>? search(String query) {
    if (isDisabled) return null;
    final String lowerCaseQuery = query.trim().toLowerCase();
    if (lowerCaseQuery.isEmpty) return widget.items;
    return widget.items
        .where((e) => e.toString().toLowerCase().contains(lowerCaseQuery))
        .toList();
  }

  bool get enabled => widget.items.isNotEmpty && widget.enabled;
  bool get isDisabled => !enabled;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    if (debounce.isRunning) debounce.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.text = selectedValue?.toString() ?? '';
      });
    }
    return TypeAheadField<T>(
      controller: _controller,
      suggestionsCallback: search,
      emptyBuilder: (_) => widget.items.isEmpty
          ? const SizedBox.shrink()
          : ListTile(title: Text(localeLang(context).notExist)),
      builder: (context, controller, focusNode) {
        return TextFormField(
          autofillHints: widget.autofillHints,
          readOnly: isDisabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          enabled: enabled,
          focusNode: focusNode,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onFieldSubmitted: (_) => _selectItem(),
          onChanged: (_) => debounce(_selectItem),
          validator: (val) {
            final String? err = widget.validator?.call(selectedValue);
            if (err != null) {
              return err;
            } else if (widget.errorMessage != null && selectedValue == null) {
              return widget.errorMessage;
            }
            return null;
          },
          decoration: MyTextFieldDecoration.defaultDecoration(
            context,
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: isDisabled ? context.theme.disabledColor : null,
            ),
          ),
        );
      },
      itemBuilder: (_, i) => ListTile(title: Text(i.toString())),
      onSelected: (value) {
        if (isDisabled) return;

        selectedValue = value;
        widget.onChanged?.call(selectedValue);
        _controller.text = value.toString();
      },
    );
  }

  void _selectItem() {
    if (selectedValue?.toString() == _controller.text.trim()) return;
    selectedValue = null;
    final List<T>? list = search(_controller.text.trim());

    if (list?.firstOrNull?.toString() == _controller.text.trim()) {
      selectedValue = list!.first;
      _controller.text = _controller.text.trim();
    }

    widget.onChanged?.call(selectedValue);
    setState(() {});
  }
}
