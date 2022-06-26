import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/constants/asset_constants.dart';
import 'package:hackathon/shared/styles.dart';
import 'package:hackathon/viewmodels/city_selection_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CitySelectionView extends StatelessWidget {
  const CitySelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CitySelectionViewModel>.reactive(
      viewModelBuilder: () => CitySelectionViewModel(),
      onDispose: (viewModel) => viewModel.disposeControllers(),
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: appBackgroundColor,
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => viewModel.navigateBack(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Image.asset(
                            AssetConstants.backArrow,
                            width: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        "Select City",
                        style: heading1.copyWith(fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          top: 15, left: 22, right: 22, bottom: 9),
                      height: 63,
                      decoration: BoxDecoration(
                        color: appBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: appBlackColor.withOpacity(0.14),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: viewModel.searchController,
                        textAlignVertical: TextAlignVertical.center,
                        style: paragraph2.copyWith(
                            fontSize: 17, color: appBlackColor),
                        textInputAction: TextInputAction.search,
                        maxLines: 1,
                        onSubmitted: (text) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          viewModel.setLocation(text);
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 3),
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText: 'Enter your city name',
                          hintStyle: paragraph2.copyWith(
                              fontSize: 17, color: appGrey4),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.setLocation(null),
                      child: Container(
                        height: 59,
                        color: appGrey5,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          children: [
                            Image.asset(
                              AssetConstants.geoMark,
                              width: 26,
                            ),
                            const SizedBox(width: 11),
                            Text(
                              "Current Location",
                              style: paragraph1.copyWith(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.setLocation("sydney"),
                      child: Container(
                        height: 59,
                        color: appGrey5,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Text(
                          "Sydney, Australia",
                          style: paragraph1.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.setLocation("karachi"),
                      child: Container(
                        height: 59,
                        color: appGrey5,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Text(
                          "Karachi, Pakistan",
                          style: paragraph1.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.setLocation("madrid"),
                      child: Container(
                        height: 59,
                        color: appGrey5,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Text(
                          "Madrid, Spain",
                          style: paragraph1.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
