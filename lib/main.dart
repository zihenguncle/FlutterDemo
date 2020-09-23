// ignore: avoid_web_libraries_in_flutter

import 'dart:collection';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutterdeno/LessAndFulWidget.dart';
import 'package:flutterdeno/pages/DrawView.dart';
import 'package:flutterdeno/pages/HomePageWidge.dart';
import 'package:flutterdeno/pages/LoginWidge.dart';
import 'package:flutterdeno/pages/cupertino_home/DismissiblePage.dart';
import 'package:flutterdeno/pages/cupertino_home/RouteMessage.dart';
import 'package:flutterdeno/pages/cupertino_home/WrapView.dart';
import 'package:flutterdeno/routers/Routers.dart';
import 'Application.dart';
import 'package:flutterdeno/pages/RequestHttpWidge.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/cupertino_home/HomeCupertinoButtonBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    //创建路由对象
    final router = Router();
    //配置路由集Routers的路由对象
    Routers.configureRouters(router);
    //指定Application的路由器对象
    Application.router = router;


//    final wordPair = WordPair.random();
    return MaterialApp(
      //去掉右上角的debug标签
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      home: new RandomWords(),
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.cyan[600]),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

/// 创建一个无限list列表
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  //收藏夹
  final _saved = new Set<WordPair>();

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // ignore: missing_return
          if (i.isOdd) return new Divider();
          // ignore: missing_return
          final index = i ~/ 2;
          // ignore: missing_return
          if (index >= _suggestions.length) {
            // ignore: missing_return
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Center(
          child: new Text("进入到第一个页面"),
        ),
        actions: <Widget>[
          //跳转到布局文件
          new IconButton(
            icon: new Icon(Icons.ac_unit),
            onPressed: () {
              //跳转新页面
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ScendLayoutView(
                  title: 'haa',
                );
              }));
            },
          ),
          new IconButton(
              icon: Icon(Icons.adb),
              onPressed: () {
                //跳转页面
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return LoadingUrlView();
                }));
              }),
          //跳转到收藏列表
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.blueGrey),
            child: Scaffold(
              appBar: new AppBar(
                title: new Text("收藏列表"),
              ),
              body: new ListView(children: divided),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

//加载url
class LoadingUrlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
            child: Text('使用第三方库的加载url'),
          ),
        ),
        body: ListView(children: <Widget>[
          RaisedButton(
            onPressed: () {
              const url = 'https://www.baidu.com/';
              //调用url_launcher包里得launch方法
              launch(url);
            },
            child: Text('打开百度'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LessAndFulWidget()));
            },
            child: Text('无状态和有状态的组件示例'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestWidge()));
            },
            child: Text('发送网络请求'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsernameLogin()));
            },
            child: Text('登录页面'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageWidge()));
            },
            child: Text('进入ButtonTab'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ButtonCupertinoBar()));
            },
            child: Text('使用Cupertino组件构造首页'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WrapPageView()));
            },
            child: Text('展示Wrap(流式布局)'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DismissiblePageView())),
            child: Text('Dismissible滑动删除组件'),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawWidget())),
            child: Text('自定义画板'),
          ),
          RaisedButton(
              onPressed: () => Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => RouteMessage())),
          child: Text('路由传输数据'),
          )
        ]));
  }
}

///练习布局
class ScendLayoutView extends StatelessWidget {
  final title;

  ScendLayoutView({Key key, @required this.title}) : super(key: key);
  static const url = 'https://www.baidu.com';

  @override
  Widget build(BuildContext context) {
    List<Container> _buildGridTitleList(int count) {
      return new List<Container>.generate(
          count,
          (index) => new Container(
                child: new Stack(
                  children: <Widget>[
                    Image.asset('images/fangone.jpg'),
                    GridTile(
                      child: new Container(
                        height: 30.0,
                        child: Text(''),
                      ),
                      footer: Text('this is footer'),
                      header: Text('this is header'),
                    )
                  ],
                ),
              ));
    }

    List<Widget> listtitleView = <Widget>[
      new SizedBox(
        child: new Card(
          child: new Column(
            children: <Widget>[
              ListTile(
                title: new Text(
                  'this is one',
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
                subtitle: new Text('thsi is subtitle'),
                leading: new Icon(
                  Icons.adb,
                  color: Colors.blue,
                ),
              ),
              Divider(),
              ListTile(
                title: new Text(
                  'this is two',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18.0),
                ),
                subtitle: new Text('this is twosubtitle'),
                leading: new Icon(
                  Icons.accessibility_new,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    ];

    //根据每个元素的宽去进行排版，如果元素超出屏幕自动换行
    Widget gridView = Container(
        child: new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTitleList(30),
    ));

    var stackCora = new SizedBox(
        child: new Card(
      child: new Stack(
        alignment: Alignment(0, 0.5),
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/fangtwo.jpg'),
            radius: 50.0,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black45),
            child: Text(
              'NAME',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          )
        ],
      ),
    ));

    var stackTap = new GestureDetector(
      onTap: () {
        print('myStakeButton');
      },
      child: stackCora,
    );

    //使用装饰
    Widget container = new Container(
      decoration: new BoxDecoration(color: Colors.black26),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                      border:
                          new Border.all(width: 10.0, color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/fangtwo.jpg'),
                ),
              ),
              new Expanded(
                  child: new Container(
                      decoration: new BoxDecoration(
                          border:
                              Border.all(width: 10.0, color: Colors.black38),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0))),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset('images/fangone.jpg')))
            ],
          ),
        ],
      ),
    );

    //相当于是基类
    Column columnThreeView(IconData icon, String txtone, String txtTwo) {
      return Column(
        children: <Widget>[
          new Icon(icon, color: Colors.lightGreen),
          new Text(txtone,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
          new Text(txtTwo, style: TextStyle(color: Colors.grey[850]))
        ],
      );
    }

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontSize: 13.0,
      height: 1.2,
    );

    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.account_balance, color: Colors.green[500]),
                new Text('One'),
                new Text('25 min')
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.account_balance, color: Colors.green[500]),
                new Text('One'),
                new Text('25 min')
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.account_balance, color: Colors.green[500]),
                new Text('One'),
                new Text('25 min')
              ],
            ),
          ],
        ));

    Widget itemView = new Container(
      child: new Row(
        children: [
          new Container(
            padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('This is Title'),
                new Text('This is Content'),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    new Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    new Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    new Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    new Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    new Text(
                      '阐述Revlews',
                      style: new TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
                iconList
              ],
            ),
          ),
          new Expanded(
              child: new Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(new Radius.circular(4.0))),
            child: new Image.asset(
              'images/icon_item.jpg',
            ),
          ))
        ],
      ),
    );

    Widget colcmnView = new Container(
      child: new Column(
        //默认
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Icon(Icons.ac_unit, color: Colors.greenAccent),
          new Icon(Icons.ac_unit, color: Colors.greenAccent),
          new Icon(Icons.ac_unit, color: Colors.greenAccent),
          new Icon(Icons.ac_unit, color: Colors.greenAccent),
          new Icon(Icons.ac_unit, color: Colors.greenAccent),
        ],
      ),
    );

    Widget gatherView = new Container(
        child: new Center(
      child: new Row(
//          mainAxisSize: MainAxisSize.min,//聚集widget
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
          new Icon(
            Icons.star,
            color: Colors.grey,
          ),
          new Icon(
            Icons.star,
            color: Colors.blue,
          ),
          new Icon(
            Icons.star,
            color: Colors.greenAccent,
          ),
          new Icon(
            Icons.star,
            color: Colors.amberAccent,
          )
        ],
      ),
    ));

    //图片的摆放
    Widget rowMineAxisView = new Container(
        child: new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Expanded(child: new Image.asset('images/fangone.jpg')),
          new Expanded(child: new Image.asset('images/fangtwo.jpg')),
          new Expanded(child: new Image.asset('images/fangthree.jpg'))
        ],
      ),
    ));

    Widget titleSeaction = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text('第一个TextView',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Text(
                '第二个TextView',
                style: new TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41')
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.blue),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.blue),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Center(
        child: new Text('中心内容'),
      ),
    );

    return new Scaffold(
        appBar: AppBar(
          title: new Text('练习布局'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/guobit.jpg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSeaction,
            buttonSection,
            textSection,
            rowMineAxisView,
            gatherView,
            colcmnView,
            itemView,
            container,
            stackTap,
          ],
        ));
  }
}
