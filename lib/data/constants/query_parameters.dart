class QP {

  // static const String getAllCountries = r'''
// query {
//   countries{
//     code
//     name
//     }
//   }
// ''';
  static const String getAllCountries = r'''
  query {
  countries {
    code
    name
    languages {
      name
    }
    emoji
  }
}
''';
}