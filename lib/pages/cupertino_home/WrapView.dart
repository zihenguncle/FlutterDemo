import 'package:flutter/material.dart';

class WrapPageView extends StatelessWidget {
  Widget _AddressView() {
    return Container(
      padding: const EdgeInsets.all(36.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('风景区地址',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text('北京市昌平区沙河镇兆丰家园')
            ],
          )),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text('66')
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconView(IconData icon, String iconTxt) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(
          iconTxt,
          style: TextStyle(fontSize: 12, color: Colors.blue),
        )
      ],
    );
  }

  Widget _IconTxtView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildIconView(Icons.near_me, '导航'),
        _buildIconView(Icons.phone, '电话'),
        _buildIconView(Icons.share, '分享'),
      ],
    );
  }

  Widget _introduceView(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0),
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('单击'),
              duration: Duration(milliseconds: 2000),
            ));
          },
          onDoubleTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('双击'),
              duration: Duration(milliseconds: 2000),
            ));
          },
          onLongPress: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('长按'),
              duration: Duration(milliseconds: 2000),
            ));
          },
          child: Text('''
蒂姆，我可以把你介绍给我叔叔的秘书玛丽·沃勒吗？
    '''),
        ));
  }

  Widget _boxDecorationView() {
    return Container(
      width: 160.0,
      height: 160.0,
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 4.0),
          borderRadius: BorderRadius.circular(36.0),
          color: Colors.blueGrey, //背景色
          image: DecorationImage(
              image: ExactAssetImage('images/fangone.jpg'), fit: BoxFit.cover)),
    );
  }

  Widget _textBoxShadow() {
    return Container(
      margin: EdgeInsets.only(),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: const FractionalOffset(0.5, 0),
              end: const FractionalOffset(1.0, 1.0),
              colors: <Color>[Colors.blue, Colors.lightGreen, Colors.red]),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,//模糊值
              spreadRadius: 0.5,//扩展阴影半径
//            offset: Offset(-1.0, 1.0)
            )
          ]),
      child: Text('''
      BoxShadow阴影效果
      LineraGradient线性渐变
    '''),
    );
  }

  Widget _radialGradient() {
    return Center(
        child: RotatedBox(
      quarterTurns: 3, //旋转次数，一次为90°
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9.0,
              spreadRadius: 0.5
            )
          ],
            gradient: RadialGradient(
                center: const Alignment(-0.0, -0.0),
                radius: 0.5,
                colors: <Color>[
              Colors.lightGreen,
              Colors.blue,
              Colors.blueGrey,
            ])),
        child: Container(
          width: 200.0,
          height: 200.0,
          child: Text(
            'RadialGradient环形渐变',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    ));
  }

  Widget _clipView(){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.lightGreen,
              child: Center(
                child: Text('clipOver圓形'),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blueGrey,
              child: Center(
                child: Text('clipRRedt圓角',style: TextStyle(fontSize: 12.0),),
              ),
            ),
          ),
          ClipRect(
            clipper:RectClipper(),
            child: Container(
              color: Colors.cyan,
              width: 100.0,
              height: 100.0,
              child: Center(
                child: Text('ClipRect矩形裁剪'),
              ),
            ),
          ),
          ClipPath(

          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('wrap流式布局'),
          centerTitle: true,
        ),
        body: Builder(builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              Image.asset(
                'images/guobit.jpg',
                width: 360.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              _AddressView(),
              _IconTxtView(),
              _introduceView(context),
              _boxDecorationView(),
              _textBoxShadow(),
              _radialGradient(),
              _clipView()
            ],
          );
        }));
  }
}

class RectClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(20.0, 20.0, size.width-20.0, size.height-20.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
