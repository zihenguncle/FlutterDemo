

import 'dart:io';

import 'package:dio/dio.dart';

Future request(url,{formData})async{
  try{
    Response response;
    Dio dio = Dio();

    dio.options.contentType = Headers.formUrlEncodedContentType;

    //发起POST请求，传入url及表单参数
    response = await dio.post(url,data: formData);


    //请求成功
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('请求异常');
    }
  }catch(e){
    return print('error:::$e');
  }
}