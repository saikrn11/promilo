import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';
import '../functions/navigation_anim.dart';
import 'login_page/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nav();
  }

  nav() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          myRoute(
            page: const LoginScreen(),
            animcurve: Curves.easeInOut,
            trans: 'Fade',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: greyBlue,
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Hero(
              tag: 'appName',
              child: Text(
                "PROMILO",
                style: Fonts().h1l(context).copyWith(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                color: white,
              ),
              child: RichText(
                text: TextSpan(
                  style: Fonts().h1l(context).copyWith(),
                  children: [
                    TextSpan(
                      text: "Powered by  ",
                      style: Fonts().h4l(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: black.withAlpha(100),
                          ),
                    ),
                    TextSpan(
                      text: "Sai",
                      style: Fonts().h4l(context).copyWith(
                            color: red,
                          ),
                    ),
                    TextSpan(
                      text: "Kiran",
                      style: Fonts().h4l(context).copyWith(
                            color: darkPink,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
