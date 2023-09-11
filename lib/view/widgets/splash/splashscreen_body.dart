import 'package:application_bibliotheque/view/widgets/splash/splash_animated_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with TickerProviderStateMixin {
  late AnimationController animationControllerLogo;
  late Animation<Offset> slidingAnimationLogo;
  late AnimationController animationControllerText;
  late Animation<Offset> slidingAnimationText;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation(); // Logo animation init
    goToHomeView(); // navigation
  }

  void goToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push('/loginScreen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashAnimatedBuilder(
        slidingAnimationLogo: slidingAnimationLogo,
        slidingAnimationText: slidingAnimationText,
      ),
    );
  }

  void initSlidingAnimation() {
    // Logo animation
    animationControllerLogo = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimationLogo =
        Tween<Offset>(begin: const Offset(0, -.1), end: Offset.zero)
            .animate(animationControllerLogo);

    // Text animation
    animationControllerText = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimationText =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationControllerText);

    // Start animations
    animationControllerLogo.forward();
    animationControllerText.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationControllers when the state is disposed
    animationControllerLogo.dispose();
    animationControllerText.dispose();
    super.dispose();
  }
}