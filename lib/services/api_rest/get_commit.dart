import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void getCommitData(String sha) async {
  final token = dotenv.env['GITHUB_API_TOKEN'];
  String apiUrl =
      'https://api.github.com/repos/Guix98/commits_tracker/commits/$sha';

  final Map<String, String> headers = {
    'Accept': 'application/vnd.github+json',
    'Authorization': 'Bearer $token', // Reemplaza 'ABC123' con tu token real
    'X-GitHub-Api-Version': '2022-11-28',
  };

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      print('Respuesta exitosa:');
      print(response.body);
    } else {
      print('Error en la petición: ${response.statusCode}');
    }
  } catch (e) {
    print('Error de comunicación: $e');
  }
}
