import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';
import 'package:news_app/presentation/widgets/articleItem.dart';
import 'package:news_app/presentation/widgets/bar.dart';

class BookMark extends StatelessWidget{

  const BookMark({super.key});

  Widget blocWidget (BuildContext context){
  BlocProvider.of<ArticlesCubit>(context).getMarkArticled();
  return BlocBuilder<ArticlesCubit, ArticlesState>(
    builder: (context, state) {
      if(state is MarkedArticles ){
        return ArticleItem(articles: state.markedArticle, currentIndex: 0);
      }else {
        return const SizedBox.shrink();
      }
    },
  );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      title:const Center(
        child: Text(
        'Saves',
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
              padding:const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child:  blocWidget(context),
            ),
          ),
          const Bar(iconIndex: 3,),
        ],
      ),
    );
  }

}