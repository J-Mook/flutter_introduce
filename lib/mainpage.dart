import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as IMG;
import '/provider/provider.dart';

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
          setState(() { Navigator.pushNamed(context, '/sub'); });
        },
        child: const Icon(Icons.link),
      ),
    );
  }
}

class _MainPageContents extends StatefulWidget {
  const _MainPageContents({super.key});

  @override
  State<_MainPageContents> createState() => __MainPageContentsState();
}

class __MainPageContentsState extends State<_MainPageContents> {
  
  final double _change_width = 800.0;
  double _hit = 0.0;
  double _wid = 0.0;

  List<Widget> _flex_widgets(int flex1, int flex2) {
    return [
      Flexible(
        fit: FlexFit.loose,
        flex: flex1,
        child: _name_contents(),
      ),
      // const VerticalDivider(thickness: 1, width: 0,),
      Flexible(
        fit: FlexFit.loose,
        flex: flex2,
        child: const _historic_contents(),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _wid = MediaQuery.of(context).size.width;
    _hit = MediaQuery.of(context).size.height;

    _wid > _change_width ? context.read<layoutProv>().set_hlayout() : context.read<layoutProv>().set_vlayout();

    return Container(
      child: context.read<layoutProv>().get_hlayout() ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _flex_widgets(3, 2),
      ) : ListView(
        scrollDirection: Axis.vertical,
        children: _flex_widgets(3, 2),
      )
    );
  }
}

class _name_contents extends StatelessWidget {
  const _name_contents({super.key});
  // static Image profile_image = Image.asset("assets/picpic.jpg");
  // static Image profile_image = Image(image: ResizeImage(AssetImage('assets/picpic.jpg'), width: 200));
  static const List<String> _skillsets = ["Git", "Qt", "MFC", "Python", "Pytorch", "Ubuntu", "ROS", "Open3D", "C/C++"];

  List<Widget> _contents() {
    return [
      const Text(""),
      const Row( mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("J",
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w400,
        ),),
        Text("eong WonMook",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w100,
        ),),
      ],),
      const Text("Softerware Developer",
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w100,
      ),),
      const Text(""),
      const Text(""),
      const Text("Skills",
        style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: Colors.amber[100],
      child: context.read<layoutProv>().get_hlayout() ? 
          ListView( children: _contents(), padding: EdgeInsets.all(0), ) : Column( children: _contents() )
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: _contents(),
      // ),
    );
  }
}

class _historic_contents extends StatelessWidget {
  const _historic_contents({super.key});

  static const _historic_textstyle = TextStyle(fontWeight: FontWeight.w200, color: Colors.black);

  final _context = const [
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
    Row(children: [Text("")],),
    // Flexible(child: Row(children: [Text("")],)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.brown[100],
      child: DefaultTextStyle(
        style: _historic_textstyle,
        child: context.read<layoutProv>().get_hlayout() ? 
          ListView( children: _context ) : Column( children: _context )
      ),
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