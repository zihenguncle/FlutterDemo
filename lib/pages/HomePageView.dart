import 'package:flutter/material.dart';

import 'TabBarVidget.dart';

class HomePageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconTabBarView(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text('郭先生'),
              accountEmail: Text('1263543288@qq.com'),
              currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('images/fangthree.jpg'),),
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset('images/fangtwo.jpg'),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.color_lens),),
              title: Text('個人裝扮'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.photo),),
              title: Text('我的相冊'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.wifi),),
              title: Text('免流量特權'),
            )
          ],
        ),
      ),

    );
  }
}
