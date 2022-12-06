import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsportal/model/model.dart';

class CustomHttp {
  Future<List<Articles>> fetchingNewsData() async {
    List<Articles> allNewsData = [];
    Articles articles;
    var responce = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=6975dc346ae44021bbdb995007a82ca1"));

    var data = jsonDecode(responce.body)["articles"];
    print("responce is ${data}");

    for (var i in data) {
      articles = Articles.fromJson(i);
      allNewsData.add(articles);
      print("---===========================-----------");
      print(articles);
    }
    return allNewsData;
  }
}
