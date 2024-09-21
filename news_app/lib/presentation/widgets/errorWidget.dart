import 'package:flutter/material.dart';

class Errorwidget extends StatelessWidget{

  final String errorMessage;

  const Errorwidget(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            errorMessage,
            style:const TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
            ),
          ),
          Image.asset('images/scope.gif')
        ],
      ),
    );
  }
  
}