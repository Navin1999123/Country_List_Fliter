import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_filter/business_logic/places/places_bloc.dart';
import 'package:country_filter/business_logic/places/places_event.dart';
import 'package:country_filter/presentation/routing/app_routes.dart';
import 'package:country_filter/presentation/screens/home_page/home_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (AppRoutes.homePage):
        return MaterialPageRoute(builder: (_) {
          return BlocProvider<PlacesBloc>(
              create: (_) => PlacesBloc()..add(PlacesInitialEvent()),
              child: HomePage());
        });
      default:
        throw Exception("Invalid route sent : ${settings.name}");
    }
  }
}
