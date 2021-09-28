
// servise http isteği atıp Article listesini alacağız.
import 'dart:convert';

import 'package:http/http.dart';
import 'package:json/core/model/article_model.dart';

class ApiService{
  // kullanacağınız api den endpoint leri inceleyip final bir değişkene atın
  final endPointUrl = "https://newsapi.org/v2/everything?q=tesla&from=2021-08-27&sortBy=publishedAt&apiKey=ef152fb74d8549edab31314aafe64460";

  // http request fonksiyonu

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    // ilk olarak gelen cevap başarılı mı ? yani 200 mü? kontrol et
    if(res.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(res.body);

      List<dynamic> body  = json['articles'];

      List<Article> articles = body.map((e) => Article.fromJson(e)).toList();

      return articles;
    }else{
      throw('Articles den veriler gelemiyor');
    }

  }
}