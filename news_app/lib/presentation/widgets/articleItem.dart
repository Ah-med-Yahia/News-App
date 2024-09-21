import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/data/models/article.dart';


class ArticleItem extends StatelessWidget {
  final int currentIndex;

  final List<Article> articles;

  const ArticleItem({super.key, required this.articles, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        if (articles[index].imageUrl.isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(children: [
              Container(
                  color: Colors.white,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/loading.gif',
                    image: articles[index].imageUrl,
                    width: double.infinity,
                  )),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 2, 8),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          articles[index].title,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                          ),
                        ),
                      ),
                      BlocBuilder<ArticlesCubit, ArticlesState>(
                        builder: (context, state) {
                          final isFavorite = BlocProvider.of<ArticlesCubit>(context).isFavorite(articles[index]);
                          final isMarked = BlocProvider.of<ArticlesCubit>(context).isMarked(articles[index]);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                                color: Colors.green,
                                onPressed: () {
                                BlocProvider.of<ArticlesCubit>(context).favoriteArticles(articles[index]);
                              },
                              ),
                              IconButton(
                                icon: isMarked
                                    ? const Icon(Icons.bookmark_added)
                                    : const Icon(Icons.bookmark_add_outlined),
                                color: Colors.green,
                                onPressed: () {
                                  BlocProvider.of<ArticlesCubit>(context).markedArticles(articles[index]);
                                },
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ]),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(children: [
              Container(
                color: Colors.white,
                child: currentIndex == 0
                    ? Image.asset(
                        'images/telescope.jpg',
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : currentIndex == 1
                        ? Image.asset(
                            'images/sports.jpg',
                            height: 170,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : currentIndex == 2
                            ? Image.asset(
                                'images/technology.jpg',
                                height: 190,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : currentIndex == 3
                                ? Image.asset(
                                    'images/science.jpg',
                                    height: 190,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  )
                                : currentIndex == 4
                                    ? Image.asset(
                                        'images/health.jpg',
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/business.jpg',
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(
                  articles[index].title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                  ),
                ),
              )
            ]),
          );
        }
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 17);
      },
    );
  }
}
