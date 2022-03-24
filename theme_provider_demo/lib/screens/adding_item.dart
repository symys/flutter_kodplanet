import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/items_data.dart';

class AddingItem extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        //padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        height: MediaQuery.of(context).size.height * 0.75,
        // buttonın klavye altında kalması durumuna cozum; ustteki iki satir
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: textController,
                  onChanged: (input) {
                    print(textController.text);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add Item',
                      hintText: '...'),
                  autofocus: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ItemData>(context, listen: false)
                        .addItem(textController.text);
                    Navigator.pop(context);
                  },
                  child: Text('add'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
