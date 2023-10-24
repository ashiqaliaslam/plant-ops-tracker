import 'package:plant_ops_tracker/views/components/animations/lottie_animation_view.dart';
import 'package:plant_ops_tracker/views/components/animations/models/lottie_animation.dart';

class LoadingRoundsView extends LottieAnimationView {
  const LoadingRoundsView({super.key})
      : super(
          animation: LottieAnimation.loadingRounds,
        );
}
