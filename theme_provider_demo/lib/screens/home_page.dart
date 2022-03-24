import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/item_card.dart';
import '../models/items_data.dart';
import '../screens/adding_item.dart';
import './settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon:Icon(Icons.settings), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
          },),
        ),],
        title: Text('Just Do It'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${Provider.of<ItemData>(context).items.length} Items',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: Provider.of<ItemData>(context).items.length,
                      itemBuilder: (context, index) => ItemCard(
                            title: Provider.of<ItemData>(context)
                                .items[index]
                                .title,
                            isDone: Provider.of<ItemData>(context)
                                .items[index]
                                .isDone,
                            toggleStatus: (_) {
                              Provider.of<ItemData>(context, listen: false)
                                  .toggleStatus(index);
                            },
                        deleteItem: (_) {
                          Provider.of<ItemData>(context, listen: false)
                              .removeItem(index);
                        },
                          )),
                ),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            context: context,
            builder: (context) => AddingItem(),
           isScrollControlled: true, //klavye simulatorunde buttonun altta kalması durumuna karşı cozum
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
