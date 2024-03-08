// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:promilo/app_imports/app_constant_imports.dart';
import 'package:promilo/screens/bottom_menu/bottom_nav.dart';

import '../app_urls/my_urls.dart';
import '../functions/navigation_anim.dart';
import '../models/login_model.dart';

class LoginProvider extends ChangeNotifier {
  bool validated = false;
  bool passwordVisible = true;
  bool isLoading = false;
  bool rememberMe = true;
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  visibilityChanged() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  loginUser(BuildContext context, String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        isLoading = true;
        notifyListeners();
        var bytes = utf8.encode(password);
        var shaConvert = sha256.convert(bytes).toString();
        FocusScope.of(context).unfocus();
        FormData formData = FormData.fromMap({
          'username': username,
          'password': shaConvert,
          'grant_type': 'password',
        });
        dio.options.headers['Authorization'] = URLs.authorization;

        Response response = await dio.post(
            URLs.productionHost + URLs.user + URLs.oauth + URLs.token,
            data: formData);
        if (response.statusCode == 200) {
          isLoading = true;
          notifyListeners();
          var model = LoginModel.fromJson(response.data);
          if (model.response?.accessToken != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: green,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login Successfully',
                      style: Fonts().h4l(context).copyWith(
                            color: white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const Icon(
                      Icons.thumb_up_alt_outlined,
                      color: white,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 200),
                onVisible: () {
                  Navigator.push(
                    context,
                    myRoute(
                      page: const AppBottomNavBar(),
                      animcurve: Curves.easeInOut,
                      trans: '',
                    ),
                  );
                },
              ),
            );
          }
          return model;
        }
        return null;
      } catch (e) {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invalid ID or Password',
                  style: Fonts().h4l(context).copyWith(
                        color: white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const Icon(
                  Icons.thumb_down_alt_outlined,
                  color: white,
                ),
              ],
            ),
          ),
        );
        throw Exception(e);
      }
    } else {
      isLoading = true;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invalid ID or Password',
                style: Fonts().h4l(context).copyWith(
                      color: white,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const Icon(
                Icons.thumb_down_alt_outlined,
                color: white,
              ),
            ],
          ),
        ),
      );
    }
  }

  changeRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  textChanged(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      validated = false;
      notifyListeners();
    } else {
      validated = true;
      notifyListeners();
    }
  }
}
