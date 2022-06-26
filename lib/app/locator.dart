import 'package:get_it/get_it.dart';
import 'package:hackathon/services/weather_service.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => WeatherService());
}
