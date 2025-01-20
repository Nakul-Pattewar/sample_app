import 'package:flutter/cupertino.dart';

class NumbersListProvider extends ChangeNotifier {
  List<int> numbersList = [1, 2, 3, 4];

  void add() {
    int last = numbersList.last;
    numbersList.add(last + 1);
    notifyListeners();
  }
}
