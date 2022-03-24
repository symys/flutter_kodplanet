import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String? title;
  final bool? isDone;
  final Function(bool?) toggleStatus;
  void Function(DismissDirection)? deleteItem;

  ItemCard({this.title, this.isDone, required this.toggleStatus, this.deleteItem});

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      onDismissed: deleteItem,
      key: Key(title!),
      child: Card(
        elevation: 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(title!, style: TextStyle(color: Colors.black),),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
