import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isActive;
  final Function() onTap;

  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: size.width / 6,
          maxWidth: size.width / 4,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 05,
        ),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: grey,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              icon,
              color: isActive ? lightBlue : black,
              height: 25,
            ),
            Text(
              title,
              style: Fonts().h3s(context).copyWith(
                    color: isActive ? lightBlue : black,
                    fontWeight: FontWeight.bold,
                    height: 1.8,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
