import 'package:graphql/client.dart';


const baseURL = "https://countries.trevorblades.com/";

final _httpLink = HttpLink(
  baseURL,
);

final GraphQLClient client = GraphQLClient(
  link: _httpLink,
  cache: GraphQLCache(),
);