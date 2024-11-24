import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stat_response.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<StatResponse> fetchStats(String idAlat) async {
    final response = await http.get(Uri.parse('$baseUrl/stats/$idAlat'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return StatResponse.fromJson(data);
    } else {
      throw Exception('Failed to fetch stats');
    }
  }
}
