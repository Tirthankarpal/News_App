import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;
class News {
  List<ArticleModel> news=[];
  Future<void> getNews() async{
    String url='https://newsapi.org/v2/top-headlines?country=us&apiKey=9f0a7d462b034102aa06bc3e0738e260';
    var response = await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"]!=null&&element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            title: element["title"]??'No Title',
            author: element["author"]??'Unknown Author',
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
class CatagoryNewsClass {
  List<ArticleModel> news=[];
  Future<void> getNews(String catagory) async{
    String url='https://newsapi.org/v2/top-headlines?country=us&category=$catagory&apiKey=9f0a7d462b034102aa06bc3e0738e260';
    var response = await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"]!=null&&element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            title: element["title"]??'No Title',
            author: element["author"]??'Unknown Author',
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}