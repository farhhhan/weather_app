import 'package:http/http.dart' as http;

class Weatherdataprovider {
  String apikey = "d664db04cf06b29171ae37bcdd1f895e";
  Future<http.Response> getweather(String city) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey";

      final uri = Uri.parse(url);
      final response = await http.get(uri);
      return response;
    } catch (e) {
      return http.Response("", 400);
    }
  }
}
