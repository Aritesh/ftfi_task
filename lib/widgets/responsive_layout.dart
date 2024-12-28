import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  final Widget tabletScreen;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreen,
    required this.desktopScreen,
    required this.tabletScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return desktopScreen;
        } else if (constraints.maxWidth >= 600) {
          return tabletScreen;
        } else {
          return mobileScreen;
        }
      },
    );
  }
}
