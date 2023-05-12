import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meditest/models/webtoon.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> wentoons = jsonDecode(response.body);
      for (var webtoon in wentoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
