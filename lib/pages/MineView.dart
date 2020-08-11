
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum ConferenceItem { AddMember, LockConference,ModifyLayout, TurnoffAll}

enum Action{ OK,Cancel}

class MinePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MinePageView();
}

class MinePageView extends State<MinePageWidget>{

  void ShowPopupView() async{
    await showDialog(context: context,
    builder: (BuildContext context){
      return SimpleDialog(
        title: const Text('simpleDialog提示框'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'第一行信息');
            },
            child: const Text('第一行信息'),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'第二行信息');
            },
            child: const Text('第二行信息'),
          )
        ],
      );
    });
  }


  void AlertDialogView() async{

    String _choice = 'Nothing';
    final action = await showDialog(context: context,
    builder: (BuildContext contxt){
      return AlertDialog(
        title: Text('提示'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('是否要删除？'),
              Text('删除之后数据不可恢复！')
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pop(contxt,Action.Cancel);
              },
              child: Text('取消')),
          FlatButton(
              onPressed: (){
                Navigator.pop(contxt,Action.OK);
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('点击了确定'),duration: Duration(milliseconds: 2000)));
              },
              child: Text('确定'))
        ],
      );
    });
  }

  void CupertinoAlertView() async{
    await showDialog(context: context,
    builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text('提示'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('确定要删除吗？'),
              Text('删除后无法恢复！')
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('确定'),
            onPressed: (){
              Navigator.pop(context,'确定');
            },
          ),
          CupertinoDialogAction(
              child: Text('取消'),
              onPressed: (){
                Navigator.pop(context,'取消');
              },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('弹窗'),
      ),
      body: Center(
          child: Container(
           child: ListView(
             children: <Widget>[
               FlatButton(onPressed:() {},//FlatButton扁平化按钮
                 child: PopupMenuButton<ConferenceItem>(
                   child: Text('點擊彈窗'),
                   onSelected:(ConferenceItem result) {
                     Scaffold.of(context).showSnackBar(SnackBar(content: Text(result.index.toString())));
                   },
                   itemBuilder: (BuildContext context)=>
                   <PopupMenuEntry<ConferenceItem>>[
                     const PopupMenuItem<ConferenceItem>(
                         value: ConferenceItem.AddMember,
                         child: Text('添加成員')),
                     const PopupMenuItem(
                         value: ConferenceItem.LockConference,
                         child: Text('鎖定會議')),
                     const PopupMenuItem(
                         value: ConferenceItem.ModifyLayout,
                         child: Text('修改佈局')),
                     const PopupMenuItem(
                         value: ConferenceItem.TurnoffAll,
                         child: Text('挂斷所有'))
                   ],
                 ),
               ),
               RaisedButton(onPressed: (){
                 ShowPopupView();
               },
                 child: Text('simpleDialog弹框'),
               ),
               RaisedButton(onPressed: () => AlertDialogView(),
               child: Text('AlertDialog组件示例')
               ),
               RaisedButton(
                 onPressed: ()=> CupertinoAlertView(),
                 child: Text('Cupertino组件弹窗'),
               ),
//              CupertinoActivityIndicator(
//                animating: true,
//                radius: 15.0,
//              ),
               CupertinoButton(
                   child: Text('CupertinoButton'),
                   color: Colors.cyan,
                   onPressed: (){
                     Scaffold.of(context).showSnackBar(SnackBar(content: Text('回调'),duration: Duration(milliseconds: 2000),));
                   })
             ],
           ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: '请点击FloatingActionButton',
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 7.0,
        highlightElevation: 14.0,
        onPressed: (){
          Scaffold.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds:1000),content: Text('请点击FloatingActionButton')));
        },
        mini: false,
        shape: CircleBorder(),
        isExtended: false,
      ),
      //居中设置，可以设置到左右
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}