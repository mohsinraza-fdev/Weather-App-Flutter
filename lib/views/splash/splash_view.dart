import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/constants/asset_constants.dart';
import 'package:hackathon/constants/string_constants.dart';
import 'package:hackathon/shared/helpers.dart';
import 'package:hackathon/shared/styles.dart';
import 'package:hackathon/viewmodels/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (viewModel) => viewModel.exitSplashScreen(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: appBackgroundColor,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetConstants.appLogo,
                width: 129,
              ),
            ),
            Positioned(
              bottom: 61,
              child: Text(
                StringConstants.splashScreenFooterText,
                style: paragraph1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
