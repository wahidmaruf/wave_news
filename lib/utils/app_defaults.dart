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
    'Crypto',
  ];

  static List<Country> countries = [
    Country(countryCode: "us", countryName: "United States"),
    Country(countryCode: "gb", countryName: "United Kingdom"),
    Country(countryCode: "fr", countryName: "France"),
    Country(countryCode: "de", countryName: "Germany"),
    Country(countryCode: "it", countryName: "Italy"),
    Country(countryCode: "ie", countryName: "Ireland"),
    Country(countryCode: "es", countryName: "Spain"),
    Country(countryCode: "ru", countryName: "Russia"),
    Country(countryCode: "in", countryName: "India"),
    Country(countryCode: "ca", countryName: "Canada"),
    Country(countryCode: "cn", countryName: "China"),
    Country(countryCode: "jp", countryName: "Japan"),
    Country(countryCode: "kr", countryName: "South korea"),
  ];
}