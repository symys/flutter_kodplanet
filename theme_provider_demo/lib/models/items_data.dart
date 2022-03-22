import 'package:flutter/material.dart';
import 'item.dart';

class ItemData with ChangeNotifier {
  List<Item> items = [
    Item(title: 'peynir al'),
    Item(title: 'çöpü at'),
    Item(title: 'faturayı öde'),
    Item(title: 'çöpü at')
  ];

  void toggleStatus(int index){
    items[index].toggleStatus();
    notifyListeners(); //itemsın indexteki elemanına gidip o elemanın sahip olduğu toogle statusu çalıştırcak
  }
}