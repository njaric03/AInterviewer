import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EvaluationScreen extends StatelessWidget {
  late String evaluationText;
  late double score;
  EvaluationScreen({super.key, required this.score}) {
    evaluationText = score >= 0.5
        ? 'Congratulations! You have passed the interview!\nYou scored ${score * 100} out of 100.'
        : 'Unfortunately, you have not passed.\nYou scored ${score * 100} out of 100.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the back button
        title: Text(evaluationText),
      ),
      body: const Center(),
    );
  }
}
