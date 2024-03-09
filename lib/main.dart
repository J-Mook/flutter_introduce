import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import '/provider/provider.dart';
import 'mainpage.dart';

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
        '/sub' : (context) => SubPage(),
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


class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {

  double _wid = 0.0;
  double _hit = 0.0;
  var _rand_posx = 0.0;
  var _rand_posy = 0.0;
  var _rand_width = 100.0;
  var _rand_height = 100.0;
  var _onPlay = false;
  Color? _rand_color = Colors.blue;
  
  @override
  void initState() {
    super.initState();
  }

  double _mouse_x = 0.0;
  double _mouse_y = 0.0;
  void _updateLocation(PointerEvent details) {
    setState(() {
      _mouse_x = details.position.dx;
      _mouse_y = details.position.dy;
    });
  }

  void _randomzie(){
    _rand_posx = _mouse_x;
    _rand_posy = _mouse_y;
    _rand_posx = (Random().nextDouble() - 0.5) * _wid;
    _rand_posy = (Random().nextDouble()) * _hit / 2;
    // _rand_width = Random().nextDouble() * 100;
    // _rand_height = Random().nextDouble() * 100;
    
    _rand_color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _wid = MediaQuery.of(context).size.width;
    _hit = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: MouseRegion(
        onHover: _updateLocation, 
          child:  Flexible(
            fit: FlexFit.tight,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _onPlay = !_onPlay;
                    if(_onPlay) _randomzie();
                  },
                  child: Text("슈슉 슈숙.슉.", style: TextStyle(fontWeight: FontWeight.w800),)
                ),
                const Row(),
                const Text(""),
                AnimatedContainer(
                  transform: Matrix4.identity()
                  ..translate(_rand_posx, _rand_posy),
                  width: _rand_width,
                  height: _rand_height,
                  color: _rand_color,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn,
                  child: TextButton(
                    onPressed:(){
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false
                      );
                    },
                    child: Center(child: const Icon(Icons.home_filled),)
                  ),
                  onEnd: () {
                    if(_onPlay) _randomzie();
                  },
                ),
              ],
            )
          )
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/home');
      //   },
      //   child: Icon(Icons.home),
      // ),
    );
  }
}

