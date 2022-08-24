import 'package:graphql/client.dart';

import '../constants/query_parameters.dart';
import '../models/country.dart';
import 'api_client.dart';

class ApiService {

  static Future<List<Country>?> getAllCountries() async {
    var result = await client.query(
      QueryOptions(
        document: gql(QP.getAllCountries),
      ),
    );
    if(result.data != null) {
      var json = result.data!["countries"];
      List<Country> countries = [];
      for (var res in json) {
        var country = Country.fromJson(res);
        countries.add(country);
      }
      return countries;
    } else {
      return null;
    }
  }
}