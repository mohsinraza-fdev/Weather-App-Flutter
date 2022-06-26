import 'package:hackathon/app/api_client.dart';
import 'package:hackathon/models/weather_forecast_model.dart';

class Api {
  static const String _baseUrl = "https://api.weatherapi.com/v1";
  static const String _apiKey = "421f57241605410d9b960518222606";

  static Future<WeatherForecast> getWeather(String latLong) async {
    Map<String, dynamic> json = await ApiClient.get(
        _baseUrl + '/forecast.json?key=$_apiKey&q=$latLong&days=1');
    return WeatherForecast.fromJson(json);
  }
}
