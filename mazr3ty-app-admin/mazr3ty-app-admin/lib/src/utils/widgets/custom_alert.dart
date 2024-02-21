import 'package:flutter/material.dart';

class CustomDialog {
  Future<void> dialogBuilder(BuildContext context, headerTitle, contentText,
      buttonText, buttonFunction) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(headerTitle),
          content: Text(contentText),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: buttonFunction,
              child: Text(buttonText),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('ليس الان'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
