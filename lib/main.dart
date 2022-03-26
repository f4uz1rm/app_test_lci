import 'package:app_test_lci/views/task_2.dart';

import '../views/task_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyTest());
}

class MyTest extends StatelessWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(color: Colors.blueGrey)),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "TEST SKILL \nPT Layanan Cerdas Indonesia",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    onPressed: () {
                      Get.to(TaskPage1());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Task 1"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    onPressed: () {
                      Get.to(TaskPage2());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Task 2"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
