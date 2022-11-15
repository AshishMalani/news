import 'package:http/http.dart' as http;

import '../news_model/NewsModel.dart';

class NewsService {
  static DateTime dateTime = DateTime.now();
  static Future<NewsModel> NewGetData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=${dateTime.toString().split('')[0]}&sortBy=publishedAt&apiKey=2bd67bd3dbcb4a3696723118fb5eb6f8'),
    );
    return newsModelFromJson(response.body);
  }
}
