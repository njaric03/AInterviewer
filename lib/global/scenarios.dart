import 'dart:convert';

import 'package:interv_you/scenario_menu/scenario_data.dart';

Map<String, List<int>> ratings1Map = {
  "HTML/CSS": [60, 50],
  "Java": [65, 55],
  "JavaScript": [55, 50],
  "Python": [70, 55]
};

String ratings1String = jsonEncode(ratings1Map);

Scenario scenario1 = Scenario(
    title: 'Entry level',
    description:
        "You are a second-year Computer Science student applying for an entry-level software engineering position at a reputable tech company. Over the past year, you've built a solid foundation in programming through academic projects, personal exploration, and an internship at a startup. Your experience includes proficiency in Java and Python, along with web development skills in HTML, CSS, and JavaScript.",
    ratings: ratings1String);

Map<String, List<int>> ratings2Map = {
  "C#": [80, 70],
  "Java": [85, 80],
  "Python": [75, 65],
  "UML": [90, 85]
};

String ratings2String = "Shown/Expected skills:\nC#: 80/70\nJava: ";

Scenario scenario2 = Scenario(
    title: 'Team Lead',
    description:
        "You are an experienced software engineer with five years of industry experience, now applying for a team lead position at a leading tech company. You have a strong track record of managing projects and leading cross-functional teams in developing innovative software solutions. Your technical expertise spans advanced programming in languages like Java, Python, and C#, and you are skilled in Agile methodologies and project management. This role is an excellent match for your leadership skills and your ambition to drive impactful projects.",
    ratings: ratings2String);
