

import 'package:flutter/material.dart';

class UsernameLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面提交表单'),
      ),
      body: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{



  //定义一个全局key来获取form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String username;
  String password;
  void login(){
    //获取当前的form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm.validate()){
      loginForm.save();
      print('username:' + username +'\npassword:' + password);
    }
  }
  @override
  Widget build(BuildContext context) {

    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
//      print('您输入的内容为：${controller.text}');
    });

    return Theme(
        data: new ThemeData(primaryColor: Colors.black45),
        child:
        ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '请输入用户名',
                        ),
                        onSaved: (value){
                          username = value;
                        },
                        onFieldSubmitted: (value){},
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入密码',
                        ),
                        obscureText: true,
                        validator: (value){
                          return value.length < 6 ? '密码长度不够6位' : null;
                        },
                        onSaved: (value){
                          password = value;
                        },
                      ),
                    ],
                  )),
              //文本输入框表单组件
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 340.0,
                height: 42.0,
                //登录按钮
                child: RaisedButton(onPressed: login,
                  child: Text('登录'),),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: controller,
                      maxLines: 1,
                      maxLength: 30,
                      decoration: InputDecoration(
                        filled: true,
                        helperText: '用户名',
                        prefixIcon: Icon(Icons.account_circle),
                        suffixText: 'hahah',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}