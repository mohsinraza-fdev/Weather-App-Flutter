import 'package:hackathon/app/app.router.dart';
import 'package:hackathon/app/locator.dart';
import 'package:hackathon/services/weather_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _weatherService = locator<WeatherService>();

  Future<void> useCurrentLocation() async {
    setBusy(true);
    await _weatherService.updateLocation(null);
    _navigator.navigateTo(Routes.weatherView);
    setBusy(false);
  }

  void navigateToCitySelectionPage() {
    _navigator.navigateTo(Routes.citySelectionView);
  }
}
