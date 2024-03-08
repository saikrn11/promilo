import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';
import 'popup_dialog.dart';
import 'main_button.dart';

exitCard({
  required BuildContext context,
  String? heading,
  String? description,
  String? btnText,
  Color? exitTitleColor,
  Color? exitColor,
  required Function() exitFun,
  required Size size,
}) {
  return popupCard(
    context: context,
    barrierColor: red,
    bgColor: white,
    dismiss: false,
    content: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading ?? "Exit",
            style: Fonts().h3l(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description ?? "Are you sure, do you want to exit ?",
            style: Fonts().h4l(context).copyWith(
                  color: black,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      btnText == ''
          ? const SizedBox()
          : MainButton(
              onTap: exitFun,
              size: size * .4,
              color: exitColor ?? red,
              title: btnText ?? "Exit",
              titleColor: exitTitleColor ?? white,
            ),
      const SizedBox(
        height: 10,
      ),
      MainButton(
        onTap: () {
          Navigator.pop(context);
        },
        size: size * 0.4,
        color: grey,
        title: 'Cancel',
        titleColor: black,
      ),
    ],
  );
}
