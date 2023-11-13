import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_guard/controller/main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  MainController mainController = Get.put(MainController());

  List<Widget> widgets = [
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('Page 1'),
    ),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        '數位保鏢服務',
        style: TextStyle(color: Colors.white),
      )),
      bottomNavigationBar: Obx(() => NavigationBar(
            onDestinationSelected: (int index) {
              mainController.currentPage.value = index;
            },
            indicatorColor: Colors.amber[800],
            selectedIndex: mainController.currentPage.value,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: '第一頁',
              ),
              NavigationDestination(
                icon: Icon(Icons.business),
                label: '第二頁',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.school),
                icon: Icon(Icons.school_outlined),
                label: '第三頁',
              ),
            ],
          )),
      body: Obx(() => widgets[mainController.currentPage.value]),
    );
  }
}
