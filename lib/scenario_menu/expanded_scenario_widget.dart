import 'package:flutter/material.dart';
import 'package:interv_you/global/colors.dart';
import 'package:interv_you/global/global_layout.dart';
import 'package:interv_you/interview/interview_screen.dart';
import 'package:interv_you/scenario_menu/scenario_data.dart';

class ExpandedScenarioWidget extends StatelessWidget {
  final Scenario data;

  const ExpandedScenarioWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.topRight,
              child: CloseButton(), // This is the close button
            ),
            Column(
              children: <Widget>[
                Text(
                  '${data.description}\n\n${data.ratings}',
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "\u2605 \u2605 \u2606 \u2606 \u2606",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GlobalAppBarScreen(
                          title: 'Interview', child: InterviewScreen()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor),
                child: const Text(
                  'Start the interview',
                  style: TextStyle(color: AppColors.backgroundScaffold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
