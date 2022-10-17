import 'package:flutter/foundation.dart';
import 'dart:math';

class ExampleModel extends ChangeNotifier {
  int count = 0;
  int num = 0;
  int rand = 1;
  int? prand;
  int factor = 1;
  incrementAge() {
    count = (count) + factor;
    num++;
    if (num == 10) {
      factor = factor * 10;
      num = 1;
      prand = rand;
      rand = Random().nextInt(10);
      while (rand == prand) {
        rand = Random().nextInt(10);
      }
    }
    notifyListeners();
  }
}
