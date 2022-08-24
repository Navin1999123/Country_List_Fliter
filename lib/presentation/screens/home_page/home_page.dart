import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_filter/business_logic/places/places_bloc.dart';
import 'package:country_filter/business_logic/places/places_event.dart';
import 'package:country_filter/business_logic/places/places_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PlacesBloc, PlacesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PlacesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlacesWorkingState) {
            state.listOfCountries.sort(
              (a, b) => a.name.compareTo(b.name),
            );
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (val) {
                      if (val.isEmpty) {
                        BlocProvider.of<PlacesBloc>(context)
                            .add(PlacesInitialEvent());
                      } else {
                        BlocProvider.of<PlacesBloc>(context).add(
                            PlacesSearchEvent(
                                listOfCountries: state.listOfCountries,
                                searchedValue: val));
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_alt_outlined),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      hintText: "Search Country",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                state.listOfCountries.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: state.listOfCountries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.listOfCountries[index].name,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(state.listOfCountries[index].code),
                              leading: Text(state.listOfCountries[index].emoji),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.grey.shade400,
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "No Data Found : ${_controller.text}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
              ],
            );
          } else if (state is PlacesErrorState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
