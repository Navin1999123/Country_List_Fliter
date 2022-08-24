import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_filter/business_logic/places/places_event.dart';
import 'package:country_filter/business_logic/places/places_state.dart';
import 'package:country_filter/data/models/country.dart';
import 'package:country_filter/data/network/api_service.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesInitialState()) {
    List<Country>? res;
    List<Country> tempList;

    on<PlacesInitialEvent>((event, emit) async => {
          emit(PlacesLoadingState()),
          if (res != null)
            {emit(PlacesWorkingState(listOfCountries: res!))}
          else
            {
              res = await ApiService.getAllCountries(),
              if (res != null)
                {emit(PlacesWorkingState(listOfCountries: res!))}
              else
                {emit(PlacesErrorState(errorMessage: "No Data Found"))}
            }
        });
    on<PlacesSearchEvent>((event, emit) => {
          emit(PlacesLoadingState()),
          tempList = event.listOfCountries,
          tempList = event.listOfCountries
              .where((country) =>
                  country.code
                      .toString()
                      .toLowerCase()
                      .contains(event.searchedValue.toLowerCase()) ||
                  country.name
                      .toString()
                      .toLowerCase()
                      .contains(event.searchedValue.toLowerCase()))
              .toList(),
          emit(PlacesWorkingState(listOfCountries: tempList))
        });
  }
}
