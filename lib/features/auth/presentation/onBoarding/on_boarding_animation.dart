import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingAnimation extends StatefulWidget {
  const OnBoardingAnimation({super.key});

  @override
  OnBoardingAnimationState createState() => OnBoardingAnimationState();
}

class OnBoardingAnimationState extends State<OnBoardingAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 10),
    // );
    //
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     // Stop the animation at the last frame
    //     _controller.stop();
    //   }
    // });
    //
    // // Start the animation
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Lottie.asset(
              // controller: _controller,
              Assets.imagesDeliveryAnimation,
              height: 400.spMax,

              alignment: Alignment.bottomCenter,
              repeat: true, // No repeat
              animate: true,
              // onLoaded: (composition) {
              //   setState(() {
              //     _controller.duration = composition.duration;
              //   });
              // },
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
