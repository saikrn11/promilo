import 'package:flutter/material.dart';

Route myRoute({
  required Widget page,
  Curve? animcurve,
  String? trans,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionDuration: Duration(
      milliseconds: trans == 'Fade' ? 100 : 80,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      Curve curve = animcurve ?? Curves.ease;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(
        CurveTween(
          curve: curve,
        ),
      );

      return trans == 'Slide'
          ? SlideTransition(
              position: animation.drive(tween),
              child: child,
            )
          : trans == 'Fade'
              ? FadeTransition(
                  opacity: animation,
                  child: child,
                )
              : RotationTransition(
                  turns: animation,
                  child: child,
                );
    },
  );
}
