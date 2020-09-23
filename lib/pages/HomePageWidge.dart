import 'package:flutter/material.dart';

import 'HomePageView.dart';
import 'MessagePageView.dart';
import 'MineView.dart';

class HomePageWidge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //当前选中的下标
  int _selectedIndex = 1;
  List<Widget> pageList = [
    HomePageWidget(),
    MessagePageWidget(),
    MinePageWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: this.pageList.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('信息')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts), title: Text('通讯录')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('发现'))
            ],
            currentIndex: _selectedIndex,
            fixedColor: Colors.deepOrange,
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

