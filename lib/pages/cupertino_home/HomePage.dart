import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCuper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          //只展示一个title
          middle: Text('主页'),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 75.0),
            decoration: BoxDecoration(
              //背景色设置为灰色
              color: Colors.grey,
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                //上下左右边框宽度10，边框颜色蓝灰色
                                border: Border.all(
                                    width: 10.0, color: Colors.blueGrey),
                                //边框弧度
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(8.0))),
                            margin: const EdgeInsets.all(4.0),
                            child: Image.asset('images/guobit.jpg'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                //上下左右边框宽度10，边框颜色蓝灰色
                                border: Border.all(
                                    width: 10.0, color: Colors.blueGrey),
                                //边框弧度
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(8.0))),
                            margin: const EdgeInsets.all(4.0),
                            child: Image.asset('images/fangtwo.jpg'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(30.0),
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                //上下左右边框宽度10，边框颜色蓝灰色
                                border: Border.all(
                                    width: 10.0, color: Colors.blueGrey),
                                //边框弧度
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(8.0))),
                            margin: const EdgeInsets.all(4.0),
                            child: Image.asset('images/guobit.jpg'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                //上下左右边框宽度10，边框颜色蓝灰色
                                border: Border.all(
                                    width: 10.0, color: Colors.blueGrey),
                                //边框弧度
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(8.0))),
                            margin: const EdgeInsets.all(4.0),
                            child: Image.asset('images/guobit.jpg'),
                          ),
                        )
                      ],
                    ),
                    IndexedStack(
                      //indexed集成stack，多了一个index的属性，index下标为几时，就展示对应的布局，其他的都不展示了
                      index: 0,
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/fangthree.jpg'),
                          radius: 100.0,
                        ),
                        Positioned(
                            left: 30.0,
                            right: 50.0,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.blueGrey),
                              child: Text(
                                '一个文本',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.blueGrey,
                          height: 200.0,
                          width: 200.0,
                          child: FractionallySizedBox(
                            alignment: Alignment.topLeft,
                            widthFactor: 0.5,
                            heightFactor: 0.5,
                            child: Container(
                              color: Colors.blue,
                              child: Center(
                                  child: Text(
                                '百分比布局：0.5',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    decoration: TextDecoration.none),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      color: Colors.cyan,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform: Matrix4.rotationZ(0.2),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          color: Colors.blueGrey,
                          child: Text(
                            '被旋转的布局',
                            style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        //水平等间距排列布局
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Baseline(
                            baseline: 40.0,
                            //对齐字符底部水平线
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                              '第一个txt',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  textBaseline: TextBaseline.alphabetic,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Baseline(
                            baseline: 40.0,
                            baselineType: TextBaseline.alphabetic,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              color: Colors.green,
                            ),
                          ),
                          Baseline(
                            baseline: 40.0,
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                              '第二个txt',
                              style: TextStyle(
                                  fontSize: 26.0,
                                  textBaseline: TextBaseline.alphabetic,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
