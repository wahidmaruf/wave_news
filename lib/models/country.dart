class Country {
  final String countryCode;
  final String countryName;

  Country({required this.countryCode, required this.countryName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countryCode': countryCode,
      'countryName': countryName,
    };
  }
}