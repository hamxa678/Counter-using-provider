import 'package:flutter/foundation.dart';

class ListViewM extends ChangeNotifier {
  List<String> name = [
    "Hamza",
    "Hamza K",
    "Hamza Kh",
    "Hamza Kha",
    "Hamza Khan"
  ];
  List<String> desc = ["AI", "ML", "DL", "Flutter", "Web Design"];

  incrementAge(String name, String desc) {
    this.name.add(name);
    this.desc.add(desc);
    notifyListeners();
  }
}
