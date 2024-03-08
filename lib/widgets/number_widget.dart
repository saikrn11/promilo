import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

numberWidget(BuildContext context, String title,
    {FontWeight? fontWeight,
    Alignment? alignment,
    EdgeInsets? padding,
    Color? color}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(10),
    child: Align(
      alignment: alignment ?? Alignment.center,
      child: Text(
        title,
        style: Fonts().applogo(context).copyWith(
              fontWeight: fontWeight ?? FontWeight.bold,
              color: color,
            ),
      ),
    ),
  );
}

class NumberClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double h = size.height;
    // double w = size.width;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.3557143);
    path_0.quadraticBezierTo(size.width * 0.9968750, size.height * 0.4281429,
        size.width * 0.9583333, size.height * 0.4285714);
    path_0.cubicTo(
        size.width * 0.9218750,
        size.height * 0.4285714,
        size.width * 0.8489583,
        size.height * 0.4285714,
        size.width * 0.8125000,
        size.height * 0.4285714);
    path_0.quadraticBezierTo(size.width * 0.7921667, size.height * 0.4297857,
        size.width * 0.7925000, size.height * 0.4657143);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.6800000);
    path_0.quadraticBezierTo(size.width * 0.7889333, size.height * 0.7136143,
        size.width * 0.8133333, size.height * 0.7142857);
    path_0.cubicTo(
        size.width * 0.8495833,
        size.height * 0.7146429,
        size.width * 0.9220833,
        size.height * 0.7153571,
        size.width * 0.9583333,
        size.height * 0.7157143);
    path_0.quadraticBezierTo(size.width * 0.9973500, size.height * 0.7164571,
        size.width, size.height * 0.7842857);
    path_0.lineTo(size.width, size.height * 0.3557143);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
