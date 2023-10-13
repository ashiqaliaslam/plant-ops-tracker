import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_ops_tracker/views/components/animations/models/lottie_animation.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationView({
    super.key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animation.fullPath,
      reverse: reverse,
      repeat: repeat,
      // delegates: LottieDelegates(
      //   values: [
      //     ValueDelegate.dropShadow(
      //       ['**'],
      //       value: const DropShadow(
      //         Colors.orange: BlendMode.clear,.blue,
      //         direction: 100,
      //         distance: 10,
      //         radius: 10,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}
