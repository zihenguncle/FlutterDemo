

import 'package:flutter/material.dart';

Widget NoIconTabBarView(){
  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项一'),
    Tab(text: '选项二'),
    Tab(text: '选项三')
  ];
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('标题'),
          bottom: TabBar(tabs: myTabs),
          centerTitle: true,
        ),
        body: TabBarView(children: myTabs.map((e) => Text(e.text)).toList()),
      ),
    );
}

class ItemView{

  final String title;
  final IconData Icon;
  const ItemView({this.title, this.Icon });
}
const List<ItemView> items = const <ItemView>[
  const ItemView(title: '自驾', Icon: Icons.directions_car),
  const ItemView(title: '自行车', Icon: Icons.directions_bike),
  const ItemView(title: '轮船', Icon: Icons.directions_car),
  const ItemView(title: '自驾', Icon: Icons.directions_car),
  const ItemView(title: '自驾', Icon: Icons.directions_car)
];
Widget IconTabBarView(){
  return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(title: Text('选项卡'),
          bottom: TabBar(
            isScrollable: true,
            tabs: items.map((e) {
              return Tab(text: e.title,icon: Icon(e.Icon));
            }).toList(),
          ),),
        body: TabBarView(
            children: items.map((ItemView item) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectedView(itemView: item),
              );
            }).toList()
        )
      )
  );
}

class SelectedView extends StatelessWidget{
  const SelectedView({Key key,this.itemView});
  final ItemView itemView;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(itemView.Icon,size: 128.0,),
                Text(itemView.title)
              ],
            ),
          ],
        )
      )
    );
  }

}