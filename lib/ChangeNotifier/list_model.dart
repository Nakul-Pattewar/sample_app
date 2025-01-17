import 'package:flutter/widgets.dart';

class ListModel extends ChangeNotifier{
  final List<int> notifierList = [1,2,3];

  void addNumber(){
    int last = notifierList.last;
    notifierList.add(last+1);
  }
}