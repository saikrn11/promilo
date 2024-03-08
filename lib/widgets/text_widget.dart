import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

Widget textVerticalLayout({
  BuildContext? context,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  required String title,
  required String subtitle,
  Color? titleColor = black,
  Color? subColor = black,
  VerticalDirection? direction = VerticalDirection.down,
}) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    verticalDirection: direction!,
    children: [
      Text(
        title,
        style: Fonts().h4m(context).copyWith(
              fontWeight: FontWeight.w400,
              color: titleColor,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        subtitle,
        style: Fonts().h4m(context).copyWith(
              fontWeight: FontWeight.w600,
              color: subColor,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Widget textHorizontalLayout({
  BuildContext? context,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  required String title,
  required String subtitle,
  Color? titleColor = black,
  Color? subColor = black,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        title,
        style: Fonts().h4m(context).copyWith(
              color: titleColor,
              fontWeight: fontWeight,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        subtitle,
        style: Fonts().h4m(context).copyWith(
              color: titleColor,
              fontWeight: fontWeight,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
