
import 'package:flutter/material.dart';

class NevigationProvider with ChangeNotifier{
 int selectedIndex = 0;

changeSelectedIndex(index){
  selectedIndex = index;
  notifyListeners();
}

}