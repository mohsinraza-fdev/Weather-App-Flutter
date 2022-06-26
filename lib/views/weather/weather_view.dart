import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/constants/asset_constants.dart';
import 'package:hackathon/shared/styles.dart';
import 'package:hackathon/viewmodels/weather_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherViewModel>.reactive(
      onModelReady: (viewModel) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        );
        viewModel.getWeatherInfo();
      },
      viewModelBuilder: () => WeatherViewModel(),
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark),
          );
          return true;
        },
        child: Scaffold(
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                )
              : SizedBox.expand(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(viewModel.getWeatherImage()),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 65,
                                left: 23,
                                child: GestureDetector(
                                  onTap: () => viewModel.getWeatherInfo(),
                                  child: Image.asset(
                                    AssetConstants.refreshIcon,
                                    width: 18,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 61,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      viewModel.cityName.length > 17
                                          ? viewModel.cityName
                                                  .substring(0, 17) +
                                              '...'
                                          : viewModel.cityName,
                                      style: paragraph2.copyWith(
                                          color: appBackgroundColor,
                                          fontSize: 22),
                                    ),
                                    Image.asset(
                                      AssetConstants.dropdownIconWhite,
                                      width: 18,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 170,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          viewModel.forecastItems[0]["temp"],
                                          style: heading2,
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 0,
                                        child: Image.asset(
                                          AssetConstants.degreeIconLarge,
                                          width: 23,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: -13,
                                          child: Text(
                                            viewModel.weatherStatus,
                                            style: paragraph2.copyWith(
                                                color: appBackgroundColor,
                                                fontSize: 22),
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 21),
                        child: Row(
                          children: [
                            Text(
                              'Today',
                              style: paragraph1.copyWith(fontSize: 20),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  viewModel.locationName,
                                  style: paragraph2.copyWith(
                                      fontSize: 15, color: appGrey3),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 3),
                            ...List.generate(
                              viewModel.forecastItems.length,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 19),
                                child: Column(
                                  children: [
                                    Text(
                                      viewModel.forecastItems[index]["time"],
                                      style: paragraph2,
                                    ),
                                    const SizedBox(height: 12),
                                    Image.asset(
                                      AssetConstants.cloudIcon,
                                      width: 42,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1, right: 1),
                                          child: Text(
                                            viewModel.forecastItems[index]
                                                ["temp"],
                                            style: paragraph2,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Image.asset(
                                              AssetConstants.degreeIcon),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 3),
                          ],
                        ),
                      ),
                      const SizedBox(height: 54),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
