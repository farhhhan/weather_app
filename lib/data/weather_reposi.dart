import 'dart:convert';

import 'package:wether_app_bloc/data/weather_data_provider.dart';

class Weatherrepository {
  Future<dynamic> getweather(String city) async {
    try {
      final response = await Weatherdataprovider().getweather(city);

      if (response.statusCode == 200) {
        final body = response.body;
        final weather = jsonDecode(body);
        return weather;
      }  return [];
    } catch (e) {
    
        throw Exception(e.toString());
    }
  
  }
}
