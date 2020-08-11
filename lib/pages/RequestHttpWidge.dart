

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdeno/http/DioRequestList.dart';
import 'package:flutterdeno/pages/LoginWidge.dart';
import 'package:http/http.dart' as http;

class RequestWidge extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求网络'),
      ),
      body: sendHttp(),
    );
  }
}

class sendHttp extends StatelessWidget{
  var url = 'http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=41d43d1e4ad3c4b02a0733383126539d';
  void getHttpClientData() async{
    try{
      //实例化一个HttpClient对象
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      //打印出来响应头
      var result = await response.transform(utf8.decoder).join();
      print(result);
      //关闭httpClient请求
      httpClient.close();
    }catch(e){
      print('请求失败：$e');
    }finally{

    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              http.get(url).then((response) {
                print('状态：${response.statusCode}');
                print('正文：${response.body.replaceAll('{', '\n{')}');
              }
              );
            },
            child: Text('发送一个http请求'),
          ),
          RaisedButton(
            onPressed:  getHttpClientData,
            child: Text('发送一个HttpClient请求'),
          ),
          RaisedButton(
            child: Text('使用dio请求一个消息列表'),
            onPressed:() {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> DioMessageList()));
            }
          ),
        ],
      ),
      );
  }
}