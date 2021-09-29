
import 'package:dio/dio.dart';
import 'package:jsondio/model/newsResponse_model.dart';

class DioServices{
  
 String apiKey ="ef152fb74d8549edab31314aafe64460";
 final String _url ="https://newsapi.org/v2/everything?q=tesla&from=2021-08-29&sortBy=publishedAt&apiKey=ef152fb74d8549edab31314aafe64460";

  Dio? _dio;
  DioServices(){
    _dio = Dio();
  }

  Future<List<Article?>?>? fetchNewsArticle() async{
    try {
      Response response = await _dio!.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    }on DioError catch (e) {
     if(e.response!.statusCode == 404){
    print(e.response!.statusCode);
  }else{
    print(e.message);
    
  }
    }
  }

}