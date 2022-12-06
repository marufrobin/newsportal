import 'package:http/http.dart' as http;

class CustomHttp {
  fetchingNewsData() async {
    var responce = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tech&pageSize=1&page=1&apiKey=6975dc346ae44021bbdb995007a82ca1"));
    print("responce is ${responce.body}");
  }
}
