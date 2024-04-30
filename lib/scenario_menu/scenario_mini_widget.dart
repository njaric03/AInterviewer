import 'package:flutter/material.dart';
import 'package:interv_you/global/colors.dart';
import 'package:interv_you/scenario_menu/scenario_data.dart';
import 'package:interv_you/scenario_menu/expanded_scenario_widget.dart';

class ScenarioMiniWidget extends StatelessWidget {
  final Scenario data;

  const ScenarioMiniWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ExpandedScenarioWidget(data: data);
          },
        );
      },
      child: SizedBox(
        width: 250,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                data.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                data.ratings,
                style: const TextStyle(fontSize: 16),
              ),
              const Text("\u2605 \u2605 \u2606 \u2606 \u2606")
            ],
          ),
        ),
      ),
    );
  }
}
