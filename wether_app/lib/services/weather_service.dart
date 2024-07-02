import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

// class weatherService {
//   static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
//   static const GEO_URL = 'http://api.openweathermap.org/geo/1.0/direct';
//   final String apiKey;
//   weatherService(this.apiKey);
//   Future<weather> getweather(String cityName) async {
//     final response = await http
//         .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
//     if (response.statusCode == 200) {
//       return weather.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }

//   to  Everyone
// $BASE_URL?q=$cityName&appid=$apikey&units=metric
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../models/weather_model.dart';

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  static const GEO_URL = 'http://api.openweathermap.org/geo/1.0/direct';

  final String apikey;

  WeatherService(this.apikey);

  Future<weather> getWeather(String cityName) async {
    final response = await http.get
    (Uri.parse('$BASE_URL?q=$cityName&appid=$apikey&units=metric'));

    if (response.statusCode == 200) {
      return weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  Future<List<String>> getCitySuggestion(String query) async {
    final response =
        await http.get(Uri.parse('$GEO_URL?q=$query&limit=5&appid=$apikey'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map<String>((json) => ['name'] as String).toList();
    } else {
      throw Exception('Faild to fetch city suggestion');
    }
  }
}
