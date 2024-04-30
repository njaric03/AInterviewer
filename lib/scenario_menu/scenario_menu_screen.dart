import 'package:flutter/material.dart';
import 'package:interv_you/global/global_layout.dart';
import 'package:interv_you/global/scenarios.dart';
import 'package:interv_you/scenario_menu/expanded_scenario_widget.dart';
import 'package:interv_you/scenario_menu/scenario_mini_widget.dart';

class ScenarioMenuScreen extends StatefulWidget {
  const ScenarioMenuScreen({super.key});

  final String title = 'Scenario menu';

  @override
  State<ScenarioMenuScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<ScenarioMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return GlobalAppBarScreen(
      title: 'Scenario Menu',
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ExpandedScenarioWidget(data: scenario1),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          // Add a fade animation
                          var fadeAnimation =
                              Tween(begin: 0.0, end: 1.0).animate(animation);

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 200.0),
                    child: ScenarioMiniWidget(data: scenario1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ExpandedScenarioWidget(data: scenario2),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 200.0, right: 10.0),
                    child: ScenarioMiniWidget(data: scenario2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
