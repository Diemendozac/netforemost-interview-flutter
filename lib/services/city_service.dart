import 'package:http/http.dart' as http;
import 'dart:convert';

class CityService {
  final apiKey = 'W3525agrX1nW4tFlXsXYlMtrTFyb4ttz';

  Future<List<String>> getCitySuggestions(String query) async {
    final response = await http.get(Uri.parse(
        'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apiKey&q=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['LocalizedName'].toString()).toList();
    } else {
      throw Exception('Error fetching city suggestions');
    }
  }
}