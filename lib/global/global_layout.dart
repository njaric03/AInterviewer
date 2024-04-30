import 'package:flutter/material.dart';
import 'package:interv_you/global/colors.dart';
import 'package:interv_you/global/scenarios.dart';
import 'package:interv_you/scenario_menu/expanded_scenario_widget.dart';

class GlobalAppBarScreen extends StatelessWidget {
  const GlobalAppBarScreen(
      {super.key, required this.child, required this.title});

  final Widget child;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
        backgroundColor: AppColors.secondaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Scenario 1'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ExpandedScenarioWidget(data: scenario1),
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
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.5),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Scenario 2'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
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
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.5),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
