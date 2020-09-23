import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdeno/pages/cupertino_home/RouteMessage.dart';

Handler ScendViewHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      //读取参数str，first为第一个参数
    String str = params['str'].first;
    return ScendView(str);
}
);