import 'package:flutter/material.dart';

import '../size_config.dart';

class Validator extends StatelessWidget {
  final String? textValue;
  const Validator({
    super.key,
    this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    if (textValue!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 15,
          ),
          child: Text(
            textValue!,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
