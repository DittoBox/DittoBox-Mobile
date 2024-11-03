import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class ConfirmAssignWorkerDialog extends StatelessWidget {

  final String facilityName;
  final VoidCallback onConfirm;

  const ConfirmAssignWorkerDialog({super.key, required this.facilityName, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).confirmAssignWorker),
      content: Text('${S.of(context).confirmAssignWorkerMessage} $facilityName?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: Text(S.of(context).cancel)
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.of(context).pop(),
            Navigator.of(context).pop(),
            onConfirm()
          }, 
          child: Text(S.of(context).confirm)
        )
      ],
    );
  }
}