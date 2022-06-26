import 'package:hackathon/app/app.router.dart';
import 'package:hackathon/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  Future<void> exitSplashScreen() async {
    await Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
      () => _navigator.clearStackAndShow(Routes.landingView),
    );
  }
}
