import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdeno/Application.dart';

import '../../Application.dart';

class RouteMessage extends StatelessWidget {


  _scendViewNavigator(BuildContext context) async{
    String str = '126343288';
    Application.router.navigateTo(context, '/ScendView?str=$str',transition: TransitionType.fadeIn).then((result){
      if(result != null){
        print(result);
      }
    });
  }


  Widget _centerBody(BuildContext context) {
    return
      Center(
        child: Container(
          child: CupertinoButton(
            child: Text('跳转新页面传值：123'),
            color: Colors.cyan,
            onPressed: (){
              // ignore: unnecessary_statements
              _scendViewNavigator(context);
            },
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由传输数据'),
        centerTitle: true,
      ),
      body: _centerBody(context),
    );
  }
}

class ScendView extends StatelessWidget{

  final String str;

  ScendView(this.str);

  Widget _showMessage(BuildContext context){
    return Center(
     child: Container(
       margin: EdgeInsets.only(top: 50.0),
       child: Column(
         children: <Widget>[
           Text('接收到的数据：{$str}'),
           RaisedButton(onPressed: (){
             Navigator.pop(context,'goBackMessage');
           },
           child: Text('返回数据：goBackMessage'),),
           RaisedButton(onPressed: (){
            Navigator.pop(context,'MessageTwo');
           },
           child: Text('返回数据：MessageTwo'),)
         ],
       ),
     ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('接收数据页'),
      ),
      body: _showMessage(context),
    );
  }
}

