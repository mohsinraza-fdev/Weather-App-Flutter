import 'package:hackathon/views/landing/landing_view.dart';
import 'package:hackathon/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LandingView),
  ],
)
class AppSetup {}
