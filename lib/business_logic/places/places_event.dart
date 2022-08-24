import 'package:country_filter/data/models/country.dart';

abstract class PlacesEvent {}

class PlacesInitialEvent extends PlacesEvent {}

class PlacesSearchEvent extends PlacesEvent {
  final List<Country> listOfCountries;
  final String searchedValue;
  PlacesSearchEvent(
      {required this.listOfCountries, required this.searchedValue});
}

class PlacesClearEvent extends PlacesEvent {}
