import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/repository/articles_repository.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {

  ArticlesRepository articleRepository =  ArticlesRepository();
  ArticlesCubit() : super(ArticlesInitial());

  List <Article> allArticles=[];

  List<Article> favoriteArticlesList = [];

  List<Article> markedArticlesList = [];

  intialState(){
    emit(ArticlesInitial());
  }

  void getAriticlesByCategory(String category){
    articleRepository.repositoryArticlesByCategory(category:category ).then(
      (articles){
        if(articles.isNotEmpty){
        allArticles=articles;
        emit(ArticlesLoaded(articles));
        } else{
          String errorMessage;
          switch(articleRepository.errorRes!.type){
            case DioExceptionType.connectionTimeout: 
              errorMessage = 'Connection Timed out';
              break;
            case DioExceptionType.sendTimeout:
              errorMessage = 'Send timed out';
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage = 'Receive timed out';
              break;
            case DioExceptionType.badCertificate:
              errorMessage = 'Bad Certificate';
              break;
            case DioExceptionType.badResponse:
              errorMessage = 'Bad Response';
              break;
            case DioExceptionType.cancel:
              errorMessage = 'Cancel Process';
              break;
            case DioExceptionType.connectionError:
              errorMessage = 'Connection Error';
              break;
            case DioExceptionType.unknown:
              errorMessage = 'Unknown Error';
              break;
          }
          emit(ArticlesFailed(errorMessage));
        }
      }
    );
    emit(ArticlesLoading());
  }

String clickedButton(currentIndex){
  String currentCategory;
  switch (currentIndex) {
      case 0:
        currentCategory= 'general';
      case 1:
        currentCategory= 'sports';
      case 2:
        currentCategory= 'technology';
      case 3:
        currentCategory= 'science';
      case 4:
        currentCategory= 'health';
      case 5:
        currentCategory= 'business';
      default:
        currentCategory= 'general';
    }
    getAriticlesByCategory(currentCategory);
    return currentCategory;
}

searchArticle (String searchedTitle){
  articleRepository.repositorySearchArticles(searchedArticle: searchedTitle).then(
    (articles){
      if(articles.isNotEmpty){
        allArticles = articles;
        emit(SearchArticles(articles));
      }else{
        emit(NotFound());
      }
    }
  );
}

favoriteArticles(Article article){
  if(favoriteArticlesList.any((favArticle) => favArticle.title == article.title)){
    favoriteArticlesList.remove(article);
  }else{
    favoriteArticlesList.add(article);
  }
  emit(FavoriteArticles(favoriteArticlesList));
}

markedArticles(Article article){
  if(markedArticlesList.any((favArticle) => favArticle.title == article.title)){
    markedArticlesList.remove(article);
  }else{
    markedArticlesList.add(article);
  }
  emit(MarkedArticles(markedArticlesList));
}

bool isFavorite(Article article) {
  return favoriteArticlesList.any((favArticle) => favArticle.title == article.title);
}

bool isMarked(Article article) {
  return markedArticlesList.any((favArticle) => favArticle.title == article.title);
}

getFavArticled(){
  emit(FavoriteArticles(favoriteArticlesList));
}

getMarkArticled(){
  emit(MarkedArticles(markedArticlesList));
}

}