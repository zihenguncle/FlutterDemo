import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _chatPageView();
}

class _chatPageView extends State<ChatView> {
  bool offStage = true;
  String offStageTxt = '点击展示';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 76.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Offstage(
                offstage: offStage,
                child: Text(
                  '展示或隐藏',
                  style: TextStyle(
                      fontSize: 15.0, decoration: TextDecoration.none),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (offStage) {
                      offStageTxt = '点击显示';
                    } else {
                      offStageTxt = '点击隐藏';
                    }
                    offStage = !offStage;
                  });
                },
                child: Text(offStageTxt),
              ),
            ],
          ),
        ));
  }
}

class ChatPage extends StatelessWidget {
  bool myOffStage = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('聊天'),
          trailing: Icon(CupertinoIcons.add),
          leading: Icon(CupertinoIcons.back),
        ),
        child: ChatView());
  }
}
