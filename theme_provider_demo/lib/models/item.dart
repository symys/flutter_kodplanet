class Item{
  String? title;
  bool isDone;
  Item({this.title, this.isDone=false});

  void toggleStatus(){
    isDone =! isDone;
  }
}