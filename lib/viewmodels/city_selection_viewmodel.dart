import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.router.dart';
import '../app/locator.dart';
import '../services/weather_service.dart';

class CitySelectionViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _weatherService = locator<WeatherService>();

  TextEditingController searchController = TextEditingController();

  Future<void> setLocation(String? location) async {
    setBusy(true);
    await _weatherService.updateLocation(location);
    _navigator.navigateTo(Routes.weatherView);
    setBusy(false);
  }

  navigateBack() {
    _navigator.back();
  }

  disposeControllers() {
    searchController.dispose();
  }
}
