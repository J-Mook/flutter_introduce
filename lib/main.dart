import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import '/provider/provider.dart';

import 'mainpage.dart';
import 'RandColorPage.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => layoutProv(),
    child: const MainApp()
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "jmook",
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
        '/home' : (context) => MainPage(),
        '/RandColor' : (context) => RandColorBtnPage(),
        '/cal' : (context) => CalPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalPage extends StatefulWidget {
  CalPage({super.key});

  @override
  State<CalPage> createState() => _CalPageState();
}

class _CalPageState extends State<CalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcutator??"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("7"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("8"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("9"))),),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("4"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("5"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("6"))),),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("1"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("2"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("3"))),),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 100, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("0"))),),
                  SizedBox(width: 50, height: 50, child: Container(color: Colors.amber, child: TextButton(onPressed:() { }, child: Text("."))),),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

