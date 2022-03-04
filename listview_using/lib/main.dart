import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Using'),
        ),
        body: ListViewUsing(),
      ),
    );
  }
}

class ListViewUsing extends StatefulWidget {
  const ListViewUsing({Key? key}) : super(key: key);

  @override
  State<ListViewUsing> createState() => _ListViewUsingState();
}

class _ListViewUsingState extends State<ListViewUsing> {
  @override
  Widget build(BuildContext context) {
    var listItems = [
      ListTile(
        tileColor: Colors.pink,
        title: Text('ilk'),
      ),
      ListTile(
        tileColor: Colors.blue,
        title: Text('ikinci'),
      ),
      ListTile(
        tileColor: Colors.orange,
        title: Text('son'),
      ),
    ];

    List names = ["ali", "veli", "ayse", "lale"];

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        heightFactor: 0.5,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, _) {
            return VerticalDivider(
              width: 5,
              color: Colors.orange,
            );
          },
          itemCount: names.length,
          itemBuilder: (context, index) {
            var containers = names
                .map((name) => Container(
                    color: Colors.pink,
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    child: Text(name)))
                .toList();

            return containers[index];
          },
        ),
      ),
    );
  }
}
