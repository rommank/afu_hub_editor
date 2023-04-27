import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../strings.dart';

Future<void> showCalendar(TextEditingController controller, BuildContext context,
    {String? helpText}) async {
  DateTime? pickedDate = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      locale: const Locale($Strings.uk),
      helpText: helpText,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));

  if (pickedDate != null) {
    String formattedDate = DateFormat($Strings.ukDateFormat).format(pickedDate);
    controller.text = formattedDate;
  } else {}
}

DateTime parseDateString(String string) {
  return DateFormat($Strings.ukDateFormat).parse(string);
}
