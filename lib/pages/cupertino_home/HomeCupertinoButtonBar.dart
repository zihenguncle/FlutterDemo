

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdeno/pages/HomePageWidge.dart';
import 'package:flutterdeno/pages/cupertino_home/ChatPage.dart';

import 'HomePage.dart';



class ButtonCupertinoBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
             icon: Icon(Icons.home),
             title: Text('主页')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                title: Text('聊天')
            ),
          ],
        ),
        tabBuilder: (context,index){
          return CupertinoTabView(
            builder: (context){
              switch(index){
                case 0:
                  return HomePageCuper();
                  break;
                case 1:
                  return ChatPage();
                  break;
                default:
              }
            },
          );
        }
    );
  }
}

