import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:provider/provider.dart';
import '/provider/provider.dart';


class RandColorBtnPage extends StatefulWidget {
  const RandColorBtnPage({super.key});

  @override
  State<RandColorBtnPage> createState() => _RandColorBtnPageState();
}

class _RandColorBtnPageState extends State<RandColorBtnPage> {

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
    // _rand_posx = _mouse_x;
    // _rand_posy = _mouse_y;
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
                Text("$_mouse_x", textAlign: TextAlign.left,),
                Text("$_mouse_y"),
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

