import 'dart:convert';

import 'package:final_630710733/models/weather.dart';
import '../services/api_caller.dart';

class WeatherRepository {
  Future<List<Weather>> getWeathers() async {
    try {
      var result = await ApiCaller().get('https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=bangkok');
      List<dynamic> list = jsonDecode(result);
      List<Weather> weatherList =
      list.map<Weather>((item) => Weather.fromJson(item)).toList();
      return weatherList;
    } catch (e) {
      // TODO: Handle the error appropriately
      rethrow;
    }
  }
}
