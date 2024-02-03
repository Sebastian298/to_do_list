import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;
  final Icon iconDialog;
  final DialogType dialogType;
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.iconDialog,
    required this.dialogType,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: dialogType,
            animType: AnimType.topSlide,
            title: title,
            desc: description,
            btnCancelOnPress: () {},
            btnOkOnPress: onConfirm,
          );
        },
        icon: iconDialog);
  }
}
