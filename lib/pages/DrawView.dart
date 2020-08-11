import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DrawView自定义画板'),
      ),
      body: Center(
        child: SizedBox(
          width: 500.0,
          height: 500.0,
          child: CustomPaint(
            painter: LinerPainter(),
          ),
        ),
      ),
    );
  }
}

/// 绘制一条直线
class LinerPainter extends CustomPainter {
  //定义画笔
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke; //fill有填充色

  @override
  void paint(Canvas canvas, Size size) {
    //X轴起点  Y轴起点    X轴终点  Y轴终点
//    canvas.drawLine(Offset(100.0, 30.0), Offset(300.0, 3.0), _paint);

    //X、Y   中心点等于半径园就贴着left
//  canvas.drawCircle(Offset(150.0, 100.0), 100.0, _paint);

//  Rect rect = Rect.fromPoints(Offset(50.0, 100.0), Offset(350.0, 300.0));
//  canvas.drawOval(rect, _paint);

//  Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0),radius: 100.0);//先写一个半径为100的矩形
//  Rect rect1 = Rect.fromCircle(center: Offset(200.0, 200.0),radius: 50.0);//先写一个半径为100的矩形
//  RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));//更改矩形圆角
//  RRect rrect1 = RRect.fromRectAndRadius(rect1, Radius.circular(10.0));//更改矩形圆角
//  canvas.drawDRRect(rrect,rrect1, _paint);

    canvas.drawPoints(
        PointMode.polygon,
        [
          Offset(50.0, 10.0),
          Offset(120.0, 10.0),
          Offset(120.0, 70.0),
          Offset(50.0, 70.0),
          Offset(50.0, 130.0),
          Offset(120.0, 130.0),
          Offset(120.0, 210.0),
          Offset(80.0, 190.0),
          Offset(80.0, 100.0),
          Offset(260.0, 100.0),
          Offset(200.0, 10.0),
          Offset(200.0, 210.0),
          Offset(220.0, 180.0)
        ],
        _paint);
    const PI = 3.1415926;
    Rect rect1 = Rect.fromCircle(center: Offset(200.0, 300.0), radius: 10.0);
    canvas.drawArc(rect1, 0.0, PI * 2, true, _paint);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
