import 'dart:convert';

import 'package:http/http.dart';

import '../model/article.dart';

class ApiService{
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2023-04-06&sortBy=publishedAt&apiKey=9c0a77122623422c8129446663e947ae";

  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200 ) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> article = body.map((dynamic item ) => Article.fromJson(item)).toList();
      return article;


    } else {
        throw "Data not Fetch";
    }
    }
  }
