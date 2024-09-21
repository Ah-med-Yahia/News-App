part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}


class ArticlesLoaded extends ArticlesState{

  final List<Article> articles;

  ArticlesLoaded(this.articles);

}


class ArticlesFailed extends ArticlesState{
  final String errorMessage;
  ArticlesFailed(this.errorMessage);
}


class ArticlesLoading extends ArticlesState{

}

class SearchArticles extends ArticlesState{
  final List<Article> searchedArticles;

  SearchArticles(this.searchedArticles);
}

class NotFound extends ArticlesState{
  
}


class FavoriteArticles extends ArticlesState{
  final List<Article> favArticle ;
  FavoriteArticles(this.favArticle);
}

class MarkedArticles extends ArticlesState{
  final List<Article> markedArticle ;
  MarkedArticles(this.markedArticle);
}
