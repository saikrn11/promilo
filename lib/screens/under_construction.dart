import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class UnderDevelopment extends StatelessWidget {
  const UnderDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Under Development",
        style: Fonts().h3l(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
