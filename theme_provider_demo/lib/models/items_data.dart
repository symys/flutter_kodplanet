import 'package:flutter/material.dart';
import 'item.dart';

class ItemData with ChangeNotifier {
  List<Item> items = [
    Item(title: 'peynir al'),
    Item(title: 'çöpü at'),
    Item(title: 'faturayı öde'),
  ];

  void toggleStatus(int index){
    items[index].toggleStatus();
    notifyListeners(); //itemsın indexteki elemanına gidip o elemanın sahip olduğu toogle statusu çalıştırcak
  }

  void addItem(String input){
    items.add(
      Item(title: input)
    );
    notifyListeners();
  }

  void removeItem(int index){
    items.removeAt(index);
    notifyListeners();
  }
}