import 'package:hackathon/app/locator.dart';
import 'package:hackathon/services/weather_service.dart';
import 'package:stacked/stacked.dart';

class WeatherViewModel extends BaseViewModel {
  final _weatherService = locator<WeatherService>();

  getWeatherInfo() async {
    print(_weatherService.location);
  }
}
