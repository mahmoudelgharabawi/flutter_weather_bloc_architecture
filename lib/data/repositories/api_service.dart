import 'dart:convert';
import 'package:flutter_application_1/data/models/weather.dart';
import 'package:flutter_application_1/presentation/screens/constatnts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future getWeather(String city) async {
    String requestUrl = baseUrl + city;
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      Weather _weather = Weather(
          city: city,
          temperature: decodedData['temperature'],
          yesterdayMax: decodedData['yesterdayMax'],
          yesterdayMin: decodedData['yesterdayMin'],
          todayMax: decodedData['todayMax'],
          todayMin: decodedData['todayMin']);
      return _weather;
    } else {
      print(response.statusCode);
    }
  }
}
