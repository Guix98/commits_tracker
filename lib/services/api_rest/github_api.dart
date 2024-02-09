import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GitHubApi {
  static const String baseUrl =
      'https://api.github.com/repos/Guix98/commits_tracker/';
  static String token = dotenv.env['GITHUB_API_TOKEN']!;
  static Map<String, String> _createHeaders() {
    return {
      'Accept': 'application/vnd.github+json',
      'Authorization': 'Bearer $token',
      'X-GitHub-Api-Version': '2022-11-28',
    };
  }

  static Future<void> getCommitData(
    String sha,
  ) async {
    final headers = _createHeaders();
    final String apiUrl = '$baseUrl/commits/$sha';

    _makeRequest(apiUrl, headers);
  }

  static Future<void> getAllCommits() async {
    final headers = _createHeaders();
    const String apiUrl = '$baseUrl/commits';

    _makeRequest(apiUrl, headers);
  }

  static Future<void> _makeRequest(
      String apiUrl, Map<String, String> headers) async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        debugPrint(response.body);
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error de comunicación: $e');
    }
  }
}
