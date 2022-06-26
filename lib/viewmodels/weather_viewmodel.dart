import 'package:hackathon/app/api.dart';
import 'package:hackathon/app/locator.dart';
import 'package:hackathon/models/weather_forecast_model.dart';
import 'package:hackathon/services/weather_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class WeatherViewModel extends BaseViewModel {
  final _weatherService = locator<WeatherService>();

  late String locationName;
  late String cityName;
  late String weatherStatus;

  getWeatherInfo() async {
    setBusy(true);
    WeatherForecast forecast = await Api.getWeather(_weatherService.location);
    weatherStatus = forecast.current!.condition!.text!;
    cityName = forecast.location!.tzId!.split('/')[1];
    locationName = forecast.location!.tzId!.split('/')[1] +
        ', ' +
        forecast.location!.country!;
    int time = DateTime.now().hour;
    forecastItems = List.generate(7, (index) {
      if (index == 0) {
        return {"time": 'now', "temp": forecast.current!.tempC.toString()};
      } else {
        String newTime = (time + index).toString().padLeft(2, "0") + ':' + "00";
        for (Hour hour in forecast.forecast!.forecastday![0].hour!) {
          if (hour.time!.split(" ")[1] == newTime) {
            DateTime tempDate = DateFormat("hh:mm").parse(newTime);
            var dateFormat = DateFormat("h:mm a");
            String newFormat = dateFormat.format(tempDate);
            return {"time": newFormat, "temp": hour.tempC.toString()};
          }
        }
      }
      return {"time": 'now', "temp": "22"};
    });
    setBusy(false);
    notifyListeners();
  }

  List<Map> forecastItems = [
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"},
    {"time": 'now', "temp": "22"}
  ];
}
