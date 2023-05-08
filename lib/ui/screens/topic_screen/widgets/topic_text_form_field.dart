import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../strings.dart';

Widget buildCustomTextFormField(
    {bool isRequired = false,
    required TextEditingController controller,
    required String hintText,
    required String errorText,
    required BuildContext context,
    bool autofocus = true,
    int? minLines,
    int? maxLines,
    int? maxLength,
    TextInputType? keyboardType,
    IconData? suffixIcon,
    double? prefixSpace,
    bool? readOnly,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
    void Function()? onTap,
    Function(String)? onChanged,
    String? Function(String?)? validator}) {
  return TextFormField(
    key: key,
    maxLength: maxLength,
    minLines: minLines,
    maxLines: maxLines,
    inputFormatters: inputFormatters,
    textCapitalization: TextCapitalization.sentences,
    controller: controller,
    onChanged: onChanged,
    onTap: onTap,
    readOnly: readOnly ?? false,
    keyboardType: keyboardType ?? TextInputType.text,
    validator: validator ??
        (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
    autofocus: autofocus,
    autocorrect: false,
    decoration: InputDecoration(
      border: (minLines != null)
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2))
          : null,
      focusedBorder: (minLines != null)
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2))
          : null,
      enabledBorder: (minLines != null)
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.outline))
          : null,
      hintText: hintText,
      suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      prefix: prefixSpace == null ? null : SizedBox(width: prefixSpace),
    ),
  );
}

String? validateUkInput(String? value) {
  RegExp regex = RegExp('[А-ЩЬЮЯҐЄІЇ а-щьюяґєії 0-9]');
  if (value != null && value.isNotEmpty) {
    if (!regex.hasMatch(value)) {
      return $Strings.enterTopicTitleUk;
    } else {
      return null;
    }
  }
  return $Strings.textFieldIsMandatory;
}

String? validateEnInput(String? value) {
  RegExp regex = RegExp('[a-z A-Z 0-9]');
  if (value != null && value.isNotEmpty) {
    if (!regex.hasMatch(value)) {
      return $Strings.enterTopicTitleEn;
    } else {
      return null;
    }
  }
  return $Strings.textFieldIsMandatory;
}
