import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/presentation/widgets/articleItem.dart';
import 'package:news_app/presentation/widgets/bar.dart';
import 'package:news_app/presentation/widgets/category_bar.dart';
import 'package:news_app/presentation/widgets/errorWidget.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  late List<Article> articles;

  int currentIndex = 0;

  final List categories = [
    'All',
    'Sports',
    'Technology',
    'Science',
    'Health',
    'Business',
  ];


  Widget buildBlocWidget({required BuildContext context,String category = 'general',}) {
    BlocProvider.of<ArticlesCubit>(context).getAriticlesByCategory(category);
    return BlocBuilder<ArticlesCubit, ArticlesState>(builder: (context, state) {
      if (state is ArticlesLoading) {
        return Image.asset(
          'images/shimer.gif',
          width: 250,
          fit: BoxFit.contain,
        );
      }  else if (state is ArticlesFailed) {
        var errorMessage = state.errorMessage;
        return Errorwidget(errorMessage);
      } else if (state is ArticlesLoaded){
        articles = state .articles;
        return ArticleItem(
          articles: articles,
          currentIndex: currentIndex,
        );
      }else {
        return ArticleItem(
          articles: articles,
          currentIndex: currentIndex,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Telescope',
            style: TextStyle(
                fontFamily: 'Nerko One', fontSize: 25, color: Colors.white),
          ),
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending News',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CtegoryBar(currentIndex: currentIndex, categories: categories,),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: buildBlocWidget(
                      context: context,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Bar(iconIndex: 0,),
        ],
      ),
    );
  }
}
