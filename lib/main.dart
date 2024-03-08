import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_icons/simple_icons.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JMook's Introduction"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(SimpleIcons.github),
            tooltip: 'Open jmook\'s GitHub',
            onPressed: () { },
          ),
          IconButton(
            icon: const Icon(SimpleIcons.tistory),
            tooltip: 'Open jmook\'s blog',
            onPressed: () { },
          ),
        ],
      ),
      body: _MainPageContents(),
      bottomNavigationBar: _MainBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, '/sub');
          });
        },
        child: const Icon(Icons.link),
      ),
    );
  }
}

class _MainPageContents extends StatelessWidget {
  _MainPageContents({super.key});

  static const _historic_textstyle = TextStyle(fontWeight: FontWeight.w600, color: Colors.black);
  final List<String> _skillsets = ["Git", "Qt", "MFC", "Python", "Pytorch", "Ubuntu", "ROS", "Open3D", "C/C++"];

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  const Text(""),
                  // const Text("This is Name Card"),
                  const Row( mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("J",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w400,
                    ),),
                    Text("eong WonMook",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w100,
                    ),),
                  ],),
                  const Text("Softerware Developer",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                  ),),
                  const Text(""),
                  const Text(""),
                  const Text("Skills",
                    style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w100,
                  ),),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: _skillsets.map((e){
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onPressed: (){},
                        child: Text(e),
                      );
                    }).toList(),
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
              constraints: const BoxConstraints(minWidth: 200),
              color: Colors.brown[100],
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: _historic_textstyle,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("2023.02.06 ~ "),
                        Text("i3System"),
                        Text("Software Engineer"),
                        Text(""),
                        Text("2021.02.01 ~ 2023.01.27"),
                        Text("🏫 42Seoul"),
                        Text("Cadet"),
                        Text(""),
                        Text("2019.11.28 ~ 2022.08.31"),
                        Text("K-Road (Autonomous-Driving Club)"),
                        Text("Club officer / Vehicle Control Part Leader"),
                        Text(""),
                        Text("2020.03.01 ~ 2022.02.22"),
                        Text("Cepheus (Amateur astronomy Club)"),
                        Text("Club President"),
                        Text(""),
                        Text("2017.11.08 ~ 2019.05.04"),
                        Text("Korea Military Academy (ROK Army)"),
                        Text("Transportation"),
                        Text(""),
                        Text("2017.03.01 ~ 2017.08.22"),
                        Text("Robust (Robot, Drone, 3D Printing Club)"),
                        Text("Club President"),
                        Text(""),
                        Text("2014.03.01 ~ 2015.03.01"),
                        Text("Alchemy (Chemistry Club)"),
                        Text("Club President"),
                        Text(""),
                        Text("Since 1997.10.29"),
                      ]
                    )
                  ),
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}

class Subpage extends StatefulWidget {
  const Subpage({super.key});

  @override
  State<Subpage> createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {

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

  void _randomzie(){
    _rand_posx = (Random().nextDouble() - 0.5) * 300;
    _rand_posy = (Random().nextDouble()) * 300;
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
            ElevatedButton(
              onPressed: () async {
                _onPlay = !_onPlay;
                if(_onPlay) _randomzie();
              },
              child: Text("슈슉 슈숙.슉.", style: TextStyle(fontWeight: FontWeight.w800),)
            ),
            const Text(""),
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
              onEnd: () {
                if(_onPlay) _randomzie();
              },
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

class _MainBottomAppBar extends StatefulWidget {
  const _MainBottomAppBar({super.key});

  @override
  State<_MainBottomAppBar> createState() => __MainBottomAppBarState();
}

class __MainBottomAppBarState extends State<_MainBottomAppBar> with SingleTickerProviderStateMixin {
  
  var _bSearchOpen = false;
  var _bMenuOpen = false;
  late AnimationController _controller;
  late Animation<Offset> _searchAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _searchAnimation = Tween<Offset>(begin: const Offset(0,0), end: const Offset(0, 1.5))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 40.0,
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      color: Colors.brown[300],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_bMenuOpen){ _controller.forward(); } else { _controller.reverse(); }
                _bMenuOpen = !_bMenuOpen;
              },
            ),
            // if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_bSearchOpen){ _controller.forward(); } else { _controller.reverse(); }
                _bSearchOpen = !_bSearchOpen;
              },
            ),
            // if (_bSearchOpen) const SizedBox(
            //   width: 250,
            //   child: TextField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Search',
            //     ),
            //   ),
            // ),
            SlideTransition(
              position: _searchAnimation,
              child: const SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}