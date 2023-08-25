import 'package:wavenews/models/country.dart';

class AppDefaults {
  static const List<String> categories = [
    'World',
    'Top',
    'Politics',
    'Environment',
    'Technology',
    'Business',
    'Sports',
    'Food',
    'Health',
    'Tourism',
    'Entertainment',
  ];

  static List<Country> countries = [
    Country(countryCode: "us", countryName: "United States"),
    Country(countryCode: "gb", countryName: "United Kingdom"),
    Country(countryCode: "fr", countryName: "France"),
    Country(countryCode: "de", countryName: "Germany"),
    Country(countryCode: "it", countryName: "Italy"),
    Country(countryCode: "no", countryName: "Norway"),
    Country(countryCode: "ie", countryName: "Ireland"),
    Country(countryCode: "ru", countryName: "Russia"),
    Country(countryCode: "in", countryName: "India"),
    Country(countryCode: "br", countryName: "Brazil"),
    Country(countryCode: "ar", countryName: "Argentina"),
  ];
}