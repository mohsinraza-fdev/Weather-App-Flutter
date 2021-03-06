// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/city_selection/city_selection_view.dart';
import '../views/landing/landing_view.dart';
import '../views/splash/splash_view.dart';
import '../views/weather/weather_view.dart';

class Routes {
  static const String splashView = '/';
  static const String landingView = '/landing-view';
  static const String weatherView = '/weather-view';
  static const String citySelectionView = '/city-selection-view';
  static const all = <String>{
    splashView,
    landingView,
    weatherView,
    citySelectionView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.landingView, page: LandingView),
    RouteDef(Routes.weatherView, page: WeatherView),
    RouteDef(Routes.citySelectionView, page: CitySelectionView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LandingView(),
        settings: data,
      );
    },
    WeatherView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WeatherView(),
        settings: data,
      );
    },
    CitySelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CitySelectionView(),
        settings: data,
      );
    },
  };
}
