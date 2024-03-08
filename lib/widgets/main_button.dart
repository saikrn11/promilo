import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color splashColor;
  final Color borderColor;
  final Color color;
  final Function() onTap;
  final Color titleColor;
  final Size size;
  final TextDirection direction;
  final bool isRounded;
  final bool isOutline;

  const MainButton({
    super.key,
    this.icon,
    this.title,
    this.color = red,
    this.splashColor = grey,
    this.borderColor = white,
    required this.onTap,
    this.titleColor = white,
    required this.size,
    this.isRounded = false,
    this.direction = TextDirection.ltr,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      splashColor: splashColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 08,
      ),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          isRounded ? 50 : 15,
        ),
        side: !isOutline
            ? BorderSide.none
            : BorderSide(
                color: borderColor,
                width: 4,
                strokeAlign: BorderSide.strokeAlignCenter,
                style: BorderStyle.solid,
              ),
      ),
      color: color,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * .8,
          maxHeight: 45,
          minHeight: 25,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: direction,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title == ""
                ? const SizedBox()
                : Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        title!,
                        textAlign:
                            icon != null ? TextAlign.left : TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Fonts()
                            .h4l(
                              context,
                            )
                            .copyWith(
                              color: titleColor,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
            icon != null
                ? Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 05,
                      ),
                      child: Icon(
                        icon!,
                        color: titleColor,
                        size: 30,
                        fill: 1,
                        grade: 1,
                        weight: 30,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
