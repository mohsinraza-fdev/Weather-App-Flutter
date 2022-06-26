import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon/viewmodels/weather_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.getWeatherInfo(),
      viewModelBuilder: () => WeatherViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(),
      ),
    );
  }
}
