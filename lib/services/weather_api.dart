import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String location) async {
    var point = Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=$location&appid=38d52ade979c88e3cdc44d414777da01&units=metric');

    var respornce = await http.get(point);
    var body = jsonDecode(respornce.body);

    return Weather.fromJson(body);
  }
}
