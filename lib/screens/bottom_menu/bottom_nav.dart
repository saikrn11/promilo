import '../../../widgets/exit_popup.dart';
import '../../app_imports/app_constant_imports.dart';
import '../../app_imports/app_default_imports.dart';
import '../home_page/homepage.dart';
import '../under_construction.dart';
import '../../widgets/menu_card.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int selected = 2;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(
      initialPage: selected,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitCard(
          context: context,
          exitFun: () {
            exit(0);
          },
          size: size,
        );
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                children: const [
                  UnderDevelopment(),
                  UnderDevelopment(),
                  HomePage(),
                  UnderDevelopment(),
                  UnderDevelopment(),
                ],
              ),
            ),
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: menuList.map((e) {
                  return Expanded(
                    child: MenuItem(
                      title: e['title'] ?? "",
                      icon: e['img'] ?? "",
                      isActive: menuList.indexOf(e) == selected,
                      onTap: () {
                        controller!.animateToPage(
                          menuList.indexOf(e),
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
