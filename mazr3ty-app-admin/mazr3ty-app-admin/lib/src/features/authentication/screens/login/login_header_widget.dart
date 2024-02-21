import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(TImages.tWelcomeScreenImage),
          height: size.height * 0.8,
        ),
        Text(TTexts.tWelcomeTitle, style: Theme.of(context).textTheme.headlineMedium),
        Text(TTexts.tLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
