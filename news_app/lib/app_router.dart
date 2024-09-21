import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/presentation/screens/book_mark.dart';
import 'package:news_app/presentation/screens/favorite.dart';
import 'package:news_app/presentation/screens/home.dart';
import 'package:news_app/presentation/screens/search.dart';

class AppRouter {

  final ArticlesCubit articlesCubit = ArticlesCubit();

  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: articlesCubit,
                  child: Home(),
                ));
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: articlesCubit,
            child: Search(),
          ),
        );
      case favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value:articlesCubit,
            child: const Favorite(),
          ),
        );
      case bookMark:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value:articlesCubit,
            child: const BookMark(),
          ),
        );
    }
    return null;
  }
}
