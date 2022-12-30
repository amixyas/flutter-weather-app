import 'dart:convert';

import 'package:meteo/model/weathermodel.dart';
import 'package:meteo/services/apiconfig.dart';
import 'package:http/http.dart' as http;


class Network{

  static Future<WeatherModel> getWeatherForecastData({required String cityName}) async {
    final url = Uri.parse(ApiConfig.baseURL+ "$cityName" +"&appid=${ApiConfig.AppId}");
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather forecast, can't load $cityName weather data");
    }
  }

}