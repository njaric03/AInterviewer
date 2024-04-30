// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class Scenario {
  final String title;
  final String description;
  final String ratings;

  Scenario(
      {required this.title, required this.description, required this.ratings});

  factory Scenario.fromJson(Map<String, dynamic> json) {
    var ratingsFromJson = json['ratings'];
    String ratingsList = List<int>.from(ratingsFromJson) as String;

    return Scenario(
      title: json['title'],
      description: json['description'],
      ratings: ratingsList,
    );
  }
}

class ScenarioList {
  final List<Scenario> scenarios;

  ScenarioList({required this.scenarios});

  factory ScenarioList.fromJson(List<dynamic> json) {
    List<Scenario> scenarios = json.map((i) => Scenario.fromJson(i)).toList();
    return ScenarioList(scenarios: scenarios);
  }
}

Future<Map<String, ScenarioList>> fetchScenarios() async {
  final response = await http.get(
    Uri.parse('http://13.13.13.48:2342/api/getScenarios'),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final jsonData = json.decode(response.body);
    Map<String, ScenarioList> scenarioMap = {};
    jsonData.forEach((key, value) {
      scenarioMap[key] = ScenarioList.fromJson(value);
    });
    return scenarioMap;
  } else {
    // If the server did not return a 200 OK response,
    // throw an error or handle the response accordingly.
    throw Exception('Failed to load scenarios');
  }
}

void main() async {
  try {
    var scenarios = await fetchScenarios();
    print('Fetched scenarios: $scenarios');
  } catch (e) {
    print('Failed to fetch scenarios: $e');
  }
}
