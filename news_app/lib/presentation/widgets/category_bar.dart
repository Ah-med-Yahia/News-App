import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/articles_cubit.dart';


// ignore: must_be_immutable
class CtegoryBar extends StatelessWidget{

  String currentCategory='general';

    setCategory(int index, BuildContext context) {
    currentCategory= BlocProvider.of<ArticlesCubit>(context).clickedButton(index);
    currentIndex = index;
  }

  int currentIndex;

  List categories;

  CtegoryBar({super.key,required this.currentIndex,required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
            builder: (context, state) {
              return SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                      setCategory(index, context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentIndex == index
                          ? Colors.green
                          : const Color.fromARGB(255, 236, 236, 236),
                        foregroundColor: currentIndex == index
                          ? Colors.white
                          : Colors.black,
                        side: const BorderSide(
                          width: 1, color: Colors.green),
                          ),
                          child: Text('${categories[index]}'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 5,
                          );
                        },
                      ),
                    );
                  },
                );
  }
  
}