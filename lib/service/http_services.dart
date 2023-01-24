import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPServices {
  // static const api = 'https://swapi.dev/api/';

  static Future getData(
    String api,
  ) async {
    final uri = Uri.parse(api);
    final response = await http.get(
      uri,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
