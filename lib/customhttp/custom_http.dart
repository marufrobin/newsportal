import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsportal/model/model.dart';

class CustomHttp {
  Future<List<Articles>> fetchingNewsData() async {
    List<Articles> allNewsData = [];
    Articles articles;
    var responce = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tech&pageSize=1&page=1&apiKey=6975dc346ae44021bbdb995007a82ca1"));
    print("responce is ${responce.body}");

    var data = jsonDecode(responce.body);

    for (var i in data) {
      articles = Articles.fromJson(data);
      allNewsData.add(articles);
    }
    return allNewsData;
  }
}
