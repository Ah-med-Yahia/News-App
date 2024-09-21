import 'package:dio/dio.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/web_services/news_api.dart';


class ArticlesRepository{

  DioException? errorRes;

  NewsApi newsApi=  NewsApi();

  Future <List<Article>> repositoryArticlesByCategory( {required String category, String endPoint='/v2/top-headlines'})async{
    var articles=await newsApi.getData(
      endPoint: endPoint,
      queryParam:{
        'category':category,
        'apiKey':apiKey,
      }
      );
      if(articles.isNotEmpty){
      return articles.map(
        (article) =>Article.fromJson(article)
      ).toList();
      }else{
        errorRes=newsApi.errorRes;
        return [];
      }
  }

  Future <List<Article>> repositorySearchArticles ({required String searchedArticle})async{
    String  encodedQuery = Uri.encodeQueryComponent(searchedArticle.trim());
    var articles=await newsApi.getData(
      endPoint: '/v2/everything', 
      queryParam: {
        'q':encodedQuery,
        'sortBy':'relevancy',
        'apiKey':apiKey,
      },
    );
    if(articles.isNotEmpty){
      return articles.map(
        (article) =>Article.fromJson(article)
      ).toList();
    }else{
      return [];
    }
  }

}