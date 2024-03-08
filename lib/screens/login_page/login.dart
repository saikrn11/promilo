import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_imports/app_constant_imports.dart';
import '../../app_imports/app_default_imports.dart';
import '../../functions/text_proper.dart';
import '../../providers/login_provider.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailNum = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String? errorText;
  bool? checkbox = false;
  bool submit = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .08,
                  ),
                  Hero(
                    tag: 'applogo',
                    child: Text(
                      "promilo",
                      style: Fonts().h2l(context).copyWith(
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Hi, welcome back!".proper(),
                    style: Fonts().h3l(context).copyWith(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  MyTextField(
                    hint: 'Enter Email or Mob No.',
                    lable: 'Please Sign in to continue',
                    controller: emailNum,
                    fillColor: Colors.transparent,
                    isoutline: true,
                    isFilled: true,
                    borderColor: black,
                    textColor: black,
                    isNumber: false,
                    decimal: false,
                    signed: false,
                    validator: value.validateEmail,
                    onChange: (username) => value.textChanged(
                        username!.trim(), passWord.text.trim()),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Sign in With OTP",
                      style: Fonts().h4m(context).copyWith(
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hint: 'Enter Password',
                    lable: 'Password',
                    controller: passWord,
                    fillColor: Colors.transparent,
                    isoutline: true,
                    isFilled: true,
                    borderColor: black,
                    textColor: black,
                    isNumber: false,
                    maxLength: 8,
                    decimal: false,
                    signed: false,
                    onChange: (password) => value.textChanged(
                        password!.trim(), passWord.text.trim()),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: value.rememberMe,
                        checkColor: white,
                        activeColor: blue,
                        onChanged: (_) => value.changeRemember(),
                      ),
                      Text(
                        "Remember me",
                        style: Fonts().h4m(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password",
                          style: Fonts().h4m(context).copyWith(
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                    onTap: () {
                      if (value.validated) {
                        value.loginUser(context, emailNum.text.trim(),
                            passWord.text.trim());
                      } else {
                        null;
                      }
                    },
                    size: size,
                    isOutline: true,
                    borderColor: blue,
                    color: value.validated ? blue : blue.withAlpha(100),
                    title: value.isLoading ? "checking.." : 'Submit',
                    titleColor: white,
                  ),
                  const Spacer(),
                  FittedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Divider(
                            color: grey,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "or",
                          style: Fonts().h4l(context),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: const Divider(
                            color: grey,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: socialMedia.length,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await launchUrl(
                                Uri.parse(socialMedia[index]['link']));
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  socialMedia[index]['img'],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  textHorizontalLayout(
                    context: context,
                    title: "Business User?",
                    subtitle: "Don't have an account",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textHorizontalLayout(
                    context: context,
                    title: "Login Here",
                    subtitle: "Sign Up",
                    titleColor: blue,
                    subColor: blue,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Fonts().h1l(context).copyWith(),
                      children: [
                        TextSpan(
                          text: "By continuing, you agree to\n",
                          style: Fonts().h4l(context).copyWith(
                                fontWeight: FontWeight.w500,
                                color: black.withAlpha(100),
                              ),
                        ),
                        TextSpan(
                          text: "Promilo's ",
                          style: Fonts().h4l(context).copyWith(
                                color: black.withAlpha(100),
                              ),
                        ),
                        TextSpan(
                          text: "Terms of use & Privacy Policy",
                          style: Fonts().h4l(context).copyWith(
                                color: black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
