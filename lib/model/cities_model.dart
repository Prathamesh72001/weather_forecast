class CityList {
  final List<String>? cities;

  CityList({this.cities});

  // From JSON
  factory CityList.fromJson(Map<String, dynamic> json) {
    return CityList(
      cities: (json['cities'] as List<dynamic>?)?.map((item) => item as String).toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'cities': cities,
    };
  }
}