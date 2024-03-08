import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.active,
    this.inactiveColor = ash,
    this.activeColor = blue,
  });

  final bool active;
  final Color inactiveColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 10,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? activeColor : inactiveColor,
      ),
    );
  }
}
