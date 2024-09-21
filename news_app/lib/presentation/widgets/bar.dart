import 'package:flutter/material.dart';

class Bar extends StatelessWidget{

  const Bar({super.key, required this.iconIndex, });

  final int iconIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Container(
      height: 42,
      width: double.infinity,
      color:const Color.fromARGB(255, 255, 255, 255),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        IconButton(icon:  Icon(iconIndex==0?Icons.home: Icons.home_outlined,color:iconIndex==0 ? Colors.green:Colors.grey,) ,iconSize: 30, 
        onPressed: (){
          Navigator.pushNamed(context, '/');
        },),
        IconButton(icon:  Icon(Icons.search,color:iconIndex==1 ? Colors.green:Colors.grey,) ,iconSize: 30, onPressed: (){
          Navigator.pushNamed(context, '/search');
        },),
        IconButton(icon:  Icon(iconIndex==2?Icons.favorite: Icons.favorite_border,color:iconIndex==2 ? Colors.green:Colors.grey,) ,iconSize: 30, 
        onPressed: (){
          Navigator.pushNamed(context, '/favorite');
        },),
        IconButton(icon:  Icon(iconIndex==3?Icons.bookmark_added: Icons.bookmark_added_outlined,color:iconIndex==3 ? Colors.green:Colors.grey,) ,iconSize: 30, 
        onPressed: (){
          Navigator.pushNamed(context, '/book_mark');
        },),
        ],
      ),
    ),
  );
  }
  
}