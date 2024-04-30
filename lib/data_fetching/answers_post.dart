import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchData(String question, String answer) async {
  final response = await http.post(
    Uri.parse('http://13.13.13.48:2342/api/getEvaluation'),
    body: jsonEncode({'q': question, 'a': answer}),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final jsonData = json.decode(response.body);
    // Assume the response contains a field named 'data'
    final responseData = jsonData['data'];
    return responseData.toString();
  } else {
    // If the server did not return a 200 OK response,
    // throw an error or handle the response accordingly.
    throw Exception('Failed to load data');
  }
}
