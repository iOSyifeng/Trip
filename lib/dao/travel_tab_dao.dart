import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_trip/model/home_model.dart';

///旅拍类别接口
class TravelTabDao{
  static Future<TravelTabModel> fetch() async {
    final response = await http.get('https://www.devio.org/io/flutter_app/json/travel_page.json');
    if (response. statusCode == 200) {
      Utf8Decoder utf8Decoder = Utf8Decoder(); //修复中文乱码
      var result = json.decode(utf8Decoder.convert(response.bodyBytes));
      return TravelTabModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel_page.json');
    }
  }
}