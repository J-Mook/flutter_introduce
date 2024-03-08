import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
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
        '/sub' : (context) => Subpage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static const _Historic_textstyle = TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("J-Mook"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                color: Colors.amber[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(""),
                    Text("This is Name", textAlign: TextAlign.right,),
                    Text("Jeong WonMook",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w100,
                    ),),
                    Text("Softerware Developer",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100,
                    ),),
                    Text(""),
                    Text("Skills : Git, Qt, MFC, C/C++, Python, Pytorch, Ubuntu, ROS, Open3D",
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w100,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        OutlinedButton( child: Text("Git"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("Qt"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("MFC"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("Python"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("Pytorch"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("Ubuntu"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("ROS"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("Open3D"), onPressed: (){ }, ),
                        OutlinedButton( child: Text("C/C++"), onPressed: (){ }, ),
                        Text(""),
                      ],
                    ),
                  ]
                ),
              ),
            ),
            const VerticalDivider(thickness: 1, width: 0,),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                color: Colors.brown[100],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("2023.02.06 ~ ", style: _Historic_textstyle),
                    Text("i3System", style: _Historic_textstyle),
                    Text("Software Engineer", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2021.02.01 ~ 2023.01.27", style: _Historic_textstyle),
                    Text("🏫 42Seoul", style: _Historic_textstyle),
                    Text("Cadet", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2019.11.28 ~ 2022.08.31", style: _Historic_textstyle),
                    Text("K-Road (Autonomous-Driving Club)", style: _Historic_textstyle),
                    Text("Club officer / Vehicle Control Part Leader", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2020.03.01 ~ 2022.02.22", style: _Historic_textstyle),
                    Text("Cepheus (Amateur astronomy Club)", style: _Historic_textstyle),
                    Text("Club President", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2017.11.08 ~ 2019.05.04", style: _Historic_textstyle),
                    Text("Korea Military Academy (ROK Army)", style: _Historic_textstyle),
                    Text("Transportation", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2017.03.01 ~ 2017.08.22", style: _Historic_textstyle),
                    Text("Robust (Robot, Drone, 3D Printing Club)", style: _Historic_textstyle),
                    Text("Club President", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("2014.03.01 ~ 2015.03.01", style: _Historic_textstyle),
                    Text("Alchemy (Chemistry Club)", style: _Historic_textstyle),
                    Text("Club President", style: _Historic_textstyle),
                    Text("", style: _Historic_textstyle),
                    Text("1997.10.29 born", style: _Historic_textstyle),
                  ]
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, '/sub');
          });
        },
        child: Icon(Icons.link),
      ),
    );
  }
}

class Subpage extends StatefulWidget {
  const Subpage({super.key});

  @override
  State<Subpage> createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {

  var _rand_posx;
  var _rand_posy;
  var _rand_width;
  var _rand_height;
  Color? _rand_color;
  
  @override
  void initState() {
    super.initState();
    _randomzie();
    _rand_width = 100.0;
    _rand_height = 100.0;
  }

  void _randomzie(){
    _rand_posx = (Random().nextDouble() - 0.5) * 200;
    _rand_posy = (Random().nextDouble()) * 200;
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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                _randomzie();
              },
              child: Text("BNutttonnn")
            ),
            AnimatedContainer(
              transform: Matrix4.identity()
              ..translate(_rand_posx, _rand_posy),
              width: _rand_width,
              height: _rand_height,
              color: _rand_color,
              duration: Duration(milliseconds: 500),
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
            ),
          ],
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