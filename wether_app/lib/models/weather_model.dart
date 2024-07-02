class weather {
  final String cityName;
  final double temperture;
  final String mainCondition;

  weather(
      {required this.cityName,
      required this.temperture,
      required this.mainCondition});

  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
      cityName: json['name'],
      temperture: json['main']['temp'].toDouble(),
      //  temperture: json.main.temp.toDouble(),
      mainCondition: json['weather'][0]['main'],
      
    );
  }
}
