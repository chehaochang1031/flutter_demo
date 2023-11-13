import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_guard/api_service/api_service.dart';
import 'package:security_guard/controller/login_controller.dart';
import 'package:security_guard/routes/app_routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _textEditingController;

  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconAndTitle(),
          textField(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: loginBtn(),
          )
        ],
      ),
    );
  }

  Widget iconAndTitle() {
    return SizedBox(
      height: 136,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          const Text('數位保鏢服務')
        ],
      ),
    );
  }

  Widget textField() {
    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        hintText: '手機號碼',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 3, color: Colors.blue), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 3, color: Colors.blue), //<-- SEE HERE
        ),
      ),
    );
  }

  Widget loginBtn() {
    return InkWell(
      onTap: () async {
        var result = await ApiService.instance
            .checkAccountIsRegister(_textEditingController.text);
        if (result == null) {
          print('call api failed');
        } else {
          if (result) {
            Get.toNamed(route_main_page);
          } else {
            Get.toNamed(route_register_page);
          }
        }
      },
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: const Center(
            child: Text(
          '登入/註冊',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
