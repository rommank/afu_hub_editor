import 'package:flutter/material.dart';

class DeleteItemDialog extends StatelessWidget {
  const DeleteItemDialog({
    super.key,
    required this.itemName,
  });
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Підтвердження'),
      content: Text("Видалити цю $itemName?"),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            child: const Text('Так')),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Ні'),
        )
      ],
    );
  }
}
