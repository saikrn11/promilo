import '/app_imports/app_default_imports.dart';
import '/app_imports/app_constant_imports.dart';

Future popupCard({
  required BuildContext context,
  Color? barrierColor,
  Color? bgColor,
  String title = '',
  TextStyle? titlesStyle,
  Widget? content,
  List<Widget>? actions,
  bool dismiss = false,
  bool close = true,
}) {
  return showGeneralDialog(
    context: context,
    barrierColor: barrierColor == null
        ? black.withAlpha(150)
        : barrierColor.withAlpha(100),
    barrierDismissible: dismiss,
    barrierLabel: '',
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionDuration: const Duration(
      milliseconds: 200,
    ),
    transitionBuilder: (ctx, a1, a2, child) {
      return Transform.scale(
        scale: a1.value,
        origin: const Offset(0, 0),
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: kToolbarHeight,
          ),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: bgColor ?? white,
          title: title == ""
              ? null
              : Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: titlesStyle ??
                            Fonts().h3l(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    close
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                            color: black,
                            iconSize: 30,
                          )
                        : const SizedBox(),
                  ],
                ),
          content: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                content ?? const SizedBox(),
                Padding(
                  padding: EdgeInsets.only(
                    top: actions == null ? 0 : 20,
                    bottom: actions == null ? 0 : 20,
                  ),
                  child: Wrap(
                    spacing: 05,
                    runSpacing: 05,
                    children: actions ?? [],
                  ),
                ),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 05,
            horizontal: 25,
          ),
          titlePadding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 10,
          ),
        ),
      );
    },
  );
}
