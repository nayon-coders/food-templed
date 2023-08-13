import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forjobtest/app_config.dart';
import 'package:http/http.dart' as http;

import '../../model/productModels/foodsModel.dart';

class ProductController{


  static Future getFoods()async{
    var response = await http.get(Uri.parse("${AppConfig.FOOD_API}"),);

    print("foods data ==== ${response.body }");
    print("foods status code ==== ${response.statusCode }");
    if(response.statusCode == 200){
      //return FoodsModel.fromJson(jsonDecode(response.body));
      return response;
    }

  }



}