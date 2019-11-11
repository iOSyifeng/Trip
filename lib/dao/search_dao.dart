import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip/model/search_model.dart';
import 'package:flutter_trip/model/search_model.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:flutter_trip/model/home_model.dart';

///搜索接口
class SearchDao{
  static Future<SearchModel> fetch(String url, String text) async {
    final response = await http.get(url);
    if (response. statusCode == 200) {
      Utf8Decoder utf8Decoder = Utf8Decoder(); //修复中文乱码
      var result = json.decode(utf8Decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      model.keyword = text;
      return model;
    } else {
      throw Exception('Failed to load search_page.json');
    }
  }
}