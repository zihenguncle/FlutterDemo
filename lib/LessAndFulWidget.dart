
//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessAndFulWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) { return MyCounter(); },),
      ],
      child: MaterialApp(
        title: 'Provider示例',
        home: LessAndFulView(),
      ),
    );
  }

}
class LessAndFulView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('无状态和有状态的组件示例'),
        actions: <Widget>[
          FlatButton(
            child: Text('下一页'),
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ScendLessAndFulView())),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('点击右下角增加次数：'),
              Text('${Provider.of<MyCounter>(context).count}',style: TextStyle(fontSize: 20)),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //调用数据模型中的increment方法更改数据
          Provider.of<MyCounter>(context,listen: false).increment();
        },
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ScendLessAndFulView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击右下加增加modeld中的数据量'),
            Text('${Provider.of<MyCounter>(context).count}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '点击增加数量',
        onPressed: (){
          Provider.of<MyCounter>(context,listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }

}

class MyCounter with ChangeNotifier{
  //存储数据
  int _count = 0;
  //提供外部能够访问的数据
  int get count => _count;
  void increment(){
    _count++;
    print(_count);
    //通知所有听众进行刷新
    notifyListeners();
  }
}
