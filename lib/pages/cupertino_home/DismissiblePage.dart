import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissiblePageView extends StatelessWidget {
  List<String> items = List<String>.generate(30, (index) => '第${index}条数据');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dismissible滑动删除'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              final item = items[index];
              return Dismissible(
                  key: Key(item),
                  onDismissed: (direction){
                    //删除数组中的数据
                    items.remove(index);
                    //底部弹出消息被删除了
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item 被删除了'),));
                  },
                  child: ListTile(title: Text('$item'),));
            }
        ));
  }
}
