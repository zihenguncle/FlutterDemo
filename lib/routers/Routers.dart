
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdeno/routers/routers_handler.dart';

class Routers{
  static String root = '/pages/cupertino_home';

  static String scendView = '/ScendVie';


  static void configureRouters(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error:::router 没有找到');
      }
    );
    router.define(scendView, handler: scendViewHandler);
  }
}
