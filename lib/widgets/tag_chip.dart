import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.title,
    required this.color,
    this.textcolor,
    this.onTap,
  });

  final Function()? onTap;
  final String title;
  final Color color;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: Fonts().h4l(context).copyWith(
                color: textcolor,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
