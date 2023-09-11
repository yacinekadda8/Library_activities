import 'package:application_bibliotheque/view/widgets/splash/app_logo.dart';
import 'package:flutter/material.dart';

class SplashAnimatedBuilder extends StatelessWidget {
  const SplashAnimatedBuilder({
    super.key,
    required this.slidingAnimationLogo,
    required this.slidingAnimationText,
  });

  final Animation<Offset> slidingAnimationLogo;
  final Animation<Offset> slidingAnimationText;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimationLogo,
        builder: (context, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: slidingAnimationLogo,
                child: const AppLogo(),
              ),
              SlideTransition(
                position: slidingAnimationText,
                child: const Text(
                  'Read between the lines',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
        });
  }
}
