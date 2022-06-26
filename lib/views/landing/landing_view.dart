import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/constants/asset_constants.dart';
import 'package:hackathon/shared/helpers.dart';
import 'package:hackathon/shared/styles.dart';
import 'package:hackathon/viewmodels/landing_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'components/header_text.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.nonReactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: appBackgroundColor,
        body: Stack(
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
                const SizedBox(height: 53),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
