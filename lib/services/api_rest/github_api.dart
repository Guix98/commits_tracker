import 'dart:convert';

import 'package:commit_tracker/services/schema/remote_commit.dart';
import 'package:commit_tracker/services/schema/remote_specific_commit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GitHubApi {
  static const String baseUrl =
      'https://api.github.com/repos/Guix98/commits_tracker';
  static String token = dotenv.env['GITHUB_API_TOKEN']!;
  static Map<String, String> _createHeaders() {
    return {
      'Accept': 'application/vnd.github+json',
      'Authorization': 'Bearer $token',
      'X-GitHub-Api-Version': '2022-11-28',
    };
  }

  static Future<RemoteSpecificCommit> getCommitData(
    String sha,
  ) async {
    final headers = _createHeaders();
    final String apiUrl = '$baseUrl/commits/$sha';

    final response = await _makeRequest(apiUrl, headers);
    try {
      final commit = RemoteSpecificCommit.fromRawJson(response);
      return commit;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<RemoteCommit>> getAllCommits() async {
    List<RemoteCommit> list = [];
    final headers = _createHeaders();
    const String apiUrl = '$baseUrl/commits';

    final response = await _makeRequest(apiUrl, headers);
    try {
      final commits = jsonDecode(response) as List;
      for (var commit in commits) {
        final singleCommit = RemoteCommit.fromJson(commit);
        list.add(singleCommit);
      }
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> _makeRequest(
      String apiUrl, Map<String, String> headers) async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        debugPrint(response.body);
        return response.body;
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
        return response.statusCode.toString();
      }
    } catch (e) {
      debugPrint('Error de comunicación: $e');
      throw Exception('Error de comunicación: $e');
    }
  }
}
