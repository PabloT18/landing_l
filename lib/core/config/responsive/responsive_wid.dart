import 'package:flutter/material.dart';

import 'responsive_layouts.dart';

class ResponsiveWid extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsiveWid({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= AppLayoutConst.kmovilwidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < AppLayoutConst.ktabletwidth &&
      MediaQuery.of(context).size.width > AppLayoutConst.kmovilwidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppLayoutConst.ktabletwidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return desktop;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

// class ResponsiveLayout extends StatelessWidget {
//   final Widget largeScreen;
//   final Widget mediumScreen;
//   final Widget smallScreen;

//   const ResponsiveLayout(
//       {Key key, required this.largeScreen, this.mediumScreen, this.smallScreen})
//       : super(key: key);

//   static bool isSmallScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width < 800;
//   }

//   static bool isMediumScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > 800 &&
//         MediaQuery.of(context).size.width < 1200;
//   }

//   static bool isLargeScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > 800;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 800) {
//           return largeScreen;
//         } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
//           return mediumScreen ?? largeScreen;
//         } else {
//           return smallScreen ?? largeScreen;
//         }
//       },
//     );
//   }
// }
