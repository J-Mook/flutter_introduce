import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import '/provider/provider.dart';

import 'package:markdown/markdown.dart' as md;
import 'package:flutter/services.dart' show rootBundle;

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
        '/mdview' : (context) => mdviewpage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class mdviewpage extends StatefulWidget {
  const mdviewpage({super.key});

  @override
  State<mdviewpage> createState() => _mdviewpageState();
}

class _mdviewpageState extends State<mdviewpage> {

  String _mdfileContents = "";

  Future<void> loadAsset() async { 
    String fileText = await rootBundle.loadString('assets/sample.md');
    _mdfileContents = fileText; 
    setState(() {  });
  } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              loadAsset();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        color: Colors.amber[100],
        child: Markdown(
          // controller: controller,
          selectable: true,
          data: _mdfileContents,
          extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            <md.InlineSyntax>[
              md.EmojiSyntax(),
              ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
            ],
          ),
        ),
      ),
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

