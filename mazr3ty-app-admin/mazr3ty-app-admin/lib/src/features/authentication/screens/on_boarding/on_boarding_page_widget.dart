import 'package:flutter/material.dart';
import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding_screen.dart';

/*class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(TSizes.tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.40,
          ),
          Column(
            children: [
              Text(
                model.Title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                model.SubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Text(
            model.CounterText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 120.0,
          ),
        ],
      ),
    );
  }
}*/
