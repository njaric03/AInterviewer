import 'package:flutter/material.dart';
import 'package:interv_you/global/colors.dart';

class ProgressBar extends StatelessWidget {
  final double progress;

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: RotatedBox(
          quarterTurns: 3,
          child: SizedBox(
            height: 10.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: LinearProgressIndicator(
                value: progress,
                color: AppColors.secondaryColor,
                backgroundColor:
                    Colors.grey, // Change this to your desired track color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
