import 'package:hackathon/views/landing/landing_view.dart';
import 'package:hackathon/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/city_selection/city_selection_view.dart';
import '../views/weather/weather_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LandingView),
    MaterialRoute(page: WeatherView),
    MaterialRoute(page: CitySelectionView),
  ],
)
class AppSetup {}
