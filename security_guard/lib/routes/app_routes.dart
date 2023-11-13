import 'package:flutter/material.dart';
import 'package:security_guard/views/login_view.dart';
import 'package:security_guard/views/main_page.dart';
import 'package:security_guard/views/register_view.dart';
// import 'package:security_guard/views.dart';

String route_root = '/';
String route_main_page = '/main_page';
String route_register_page = '/register_page';

Map<String, WidgetBuilder> routes = {
  route_root: (context) => const LoginView(),
  route_main_page: (context) => MainPage(),
  route_register_page: (context) => RegisterView()
};
