import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/constants/asset_constants.dart';
import 'package:hackathon/shared/helpers.dart';
import 'package:hackathon/shared/styles.dart';
import 'package:hackathon/viewmodels/landing_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'components/current_location_button.dart';
import 'components/header_text.dart';
import 'components/select_city_button.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.nonReactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: appBackgroundColor,
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(color: appPrimaryColor),
              )
            : Stack(
                children: [
                  Positioned(
                    top: 261.5,
                    child: Image.asset(
                      AssetConstants.appLandingPageImage,
                      width: screenWidth(context),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 68),
                      const HeaderText(),
                      const Spacer(),
                      CurrentLocationButton(
                        onTap: () => viewModel.useCurrentLocation(),
                      ),
                      const SizedBox(height: 18),
                      SelectCityButton(
                        onTap: () {},
                      ),
                      const SizedBox(height: 53),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
