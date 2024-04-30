// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interv_you/global/questions.dart';

Future<Map<String, QuestionList>> fetchQuestions() async {
  final response = await http.get(
    Uri.parse('http://13.13.13.48:2342/api/getQuestions'),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final jsonData = json.decode(response.body);
    Map<String, QuestionList> questionMap = {};
    jsonData.forEach((key, value) {
      questionMap[key] = QuestionList.fromJson(value);
    });
    return questionMap;
  } else {
    // If the server did not return a 200 OK response,
    // throw an error or handle the response accordingly.
    throw Exception('Failed to load questions');
  }
}

void main() async {
  try {
    var questions = await fetchQuestions();
    print('Fetched questions: $questions');
  } catch (e) {
    print('Failed to fetch questions: $e');
  }
}
