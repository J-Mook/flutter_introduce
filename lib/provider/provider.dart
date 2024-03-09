import 'package:flutter/cupertino.dart';

class layoutProv with ChangeNotifier {
  int _layout_axis = 0;
  bool _layout_hor = false;
  bool _layout_ver = true;

  String _sel_Skills = "";

  void selectSkill(String str){ _sel_Skills = str; }
  String getselSkill(){ return _sel_Skills; }

  void set_hlayout(){
    _layout_hor = true;
    _layout_ver = false;
  }
  void set_vlayout(){
    _layout_hor = false;
    _layout_ver = true;
  }
  bool get_hlayout(){ return _layout_hor; }
  bool get_vlayout(){ return _layout_ver; }
  
}