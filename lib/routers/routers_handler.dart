import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdeno/pages/cupertino_home/RouteMessage.dart';

Handler scendViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String strMessage = params['str'].first;
      return ScendView(strMessage);
    }
);