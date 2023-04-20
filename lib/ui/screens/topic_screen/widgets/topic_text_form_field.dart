import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../strings.dart';

Widget buildTopicTextFormField(
    {required TextEditingController controller,
    required String hintText,
    required String errorText,
    bool autofocus = true,
    IconData? suffixIcon,
    bool? readOnly,
    List<TextInputFormatter>? inputFormatters,
    void Function()? onTap,
    Function(String)? onChanged,
    String? Function(String?)? validator}) {
  return TextFormField(
    inputFormatters: inputFormatters,
    textCapitalization: TextCapitalization.sentences,
    controller: controller,
    onChanged: onChanged,
    onTap: onTap,
    readOnly: readOnly ?? false,
    keyboardType: TextInputType.text,
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
        hintText: hintText, suffixIcon: suffixIcon == null ? null : Icon(suffixIcon)),
  );
}

String? validateUkInput(String? value) {
  RegExp regex = RegExp('[А-ЩЬЮЯҐЄІЇ а-щьюяґєії 0-9]');
  if (value != null && value.isNotEmpty) {
    if (!regex.hasMatch(value)) {
      return $Strings.enterTitleUk;
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
      return $Strings.enterTitleEn;
    } else {
      return null;
    }
  }
  return $Strings.textFieldIsMandatory;
}
