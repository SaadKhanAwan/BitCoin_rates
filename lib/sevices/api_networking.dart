import 'dart:convert';

import 'package:http/http.dart' as http;

String apikey = "BB2799C0-3860-4734-82F1-0DA5AFC1115C";

class ApiNetworking {
  String uRL;
  ApiNetworking({required this.uRL});

  Future getapi() async {
    http.Response response = await http.get(Uri.parse(uRL));
    if (response.statusCode == 200) {
      var data = response.body;
      var jsondata = jsonDecode(data);
      var prices = jsondata["rate"];
      return prices;
    }
  }
}
