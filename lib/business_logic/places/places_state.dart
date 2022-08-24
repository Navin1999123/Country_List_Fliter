import '../../data/models/country.dart';

abstract class PlacesState{}

class PlacesInitialState extends PlacesState{}

class PlacesLoadingState extends PlacesState{}

class PlacesErrorState extends PlacesState{
  final String errorMessage;
  PlacesErrorState({required this.errorMessage});
}

class PlacesNoDataState extends PlacesState{}

class PlacesWorkingState extends PlacesState{
  final List<Country> listOfCountries;
  PlacesWorkingState({required this.listOfCountries});
}