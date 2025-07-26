import 'package:flutter/material.dart';

class LandingPageController extends ChangeNotifier{
  int selectedIndex = 0;
  updateBottomBar(int index){
    selectedIndex = index;
    notifyListeners();
  }
}