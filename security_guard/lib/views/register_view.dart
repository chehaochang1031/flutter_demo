import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:security_guard/controller/login_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  final LoginController controlelr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('註冊會員'), leading: backIcon()),
      body: bodyWidget(),
    );
  }

  Widget backIcon() {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: const Center(
          child: Text(
            '返回',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }

  Widget bodyWidget() {
    return Column(
      children: <Widget>[
        Expanded(flex: 600, child: contentWidget()),
        Expanded(flex: 180, child: bottomWidget())
      ],
    );
  }

  Widget contentWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          getWidgetWithTitleAndComment('姓名', nameTextController, null),
          getGenderSelection(),
          getWidgetWithTitleAndComment(
              '電子信箱', emailTextController, const Text('此信箱將作為找回密碼時使用')),
          getWidgetWithTitleAndComment(
              '密碼', passwordTextController, const Text('6~15個字元的英文字母或數字')),
          getWidgetWithTitleAndComment(
              '客戶代碼', codeTextController, const Text('請輸入由簡訊所發送的客戶代碼')),
        ],
      ),
    );
  }

  Widget getWidgetWithTitleAndComment(
      String title, TextEditingController textController, Widget? extraWidget) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: '請輸入內容',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide:
                    BorderSide(width: 3, color: Colors.black12), //<-- SEE HERE
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide:
                    BorderSide(width: 3, color: Colors.black12), //<-- SEE HERE
              ),
            ),
          ),
          (extraWidget != null) ? extraWidget : Container()
        ],
      ),
    );
  }

  Widget getGenderSelection() {
    return SizedBox(
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('性別'),
          const SizedBox(
            height: 10,
          ),
          Obx(() => Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      controlelr.genderType.value = GenderType.male;
                    },
                    child: genderContent(
                        '男性',
                        (controlelr.genderType.value == GenderType.male)
                            ? true
                            : false),
                  ),
                  InkWell(
                    onTap: () {
                      controlelr.genderType.value = GenderType.female;
                    },
                    child: genderContent(
                        '女性',
                        (controlelr.genderType.value == GenderType.female)
                            ? true
                            : false),
                  ),
                  InkWell(
                    onTap: () {
                      controlelr.genderType.value = GenderType.other;
                    },
                    child: genderContent(
                        '其他',
                        (controlelr.genderType.value == GenderType.other)
                            ? true
                            : false),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget genderContent(String title, bool selection) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        children: <Widget>[
          (selection == false)
              ? Image.asset('assets/images/uncheck.png')
              : Image.asset('assets/images/check.png'),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: readAndAgreeWidget(),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Center(
                child: Text(
              '取得驗證碼',
              style: TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }

  Widget readAndAgreeWidget() {
    return Row(
      children: <Widget>[
        Obx(() => InkWell(
            onTap: () {
              controlelr.readStatus.value = !controlelr.readStatus.value;
            },
            child: (controlelr.readStatus.value == false)
                ? Image.asset('assets/images/uncheck.png')
                : Image.asset('assets/images/check.png'))),
        const SizedBox(
          width: 10,
        ),
        const Text(
          '請您閱讀並同意 用戶權益 和 隱私政策',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
