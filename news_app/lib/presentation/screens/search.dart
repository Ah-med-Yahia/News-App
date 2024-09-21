import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/presentation/widgets/articleItem.dart';
import 'package:news_app/presentation/widgets/bar.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key});

  List<Article> searchedArticles = [];

  Widget blocWidget( BuildContext context) {
    BlocProvider.of<ArticlesCubit>(context).intialState();
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is SearchArticles) {
          searchedArticles = state.searchedArticles;
          return ArticleItem(
            articles: searchedArticles,
            currentIndex: 0,
          );
        } else if (state is NotFound) {
          return Image.asset(
            'images/Not Found.gif',
            width: 250,
            fit: BoxFit.contain,
          );
        }else if(state is FavoriteArticles){
          return ArticleItem(
            articles: searchedArticles,
            currentIndex: 0,
          );
        }else if(state is MarkedArticles){
          return ArticleItem(
            articles: searchedArticles,
            currentIndex: 0,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white, // Change this color to whatever you like
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ready to uncover the hottest news?',
              style: TextStyle(
                fontFamily: 'Nerko One', fontSize: 18, color: Colors.white),
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
                padding: const EdgeInsetsDirectional.fromSTEB(11, 13, 11, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: const Color.fromARGB(255, 169, 165, 165),
                      cursorHeight: 30,
                      cursorWidth: 1.5,
                      maxLines: 1,
                      onChanged: (searchedTitle) {
                        BlocProvider.of<ArticlesCubit>(context)
                            .searchArticle(searchedTitle);
                      },
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          decoration: TextDecoration.none),
                      decoration: const InputDecoration(
                          hintText: 'Search For Articles',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 191, 190, 190),
                            fontSize: 17,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: blocWidget(context),
                    ),
                  ],
                ),
              ),
            ),
            const Bar(iconIndex: 1),
          ],
        ));
  }
}
