import 'package:flutter/material.dart';
import 'package:news_app/app_router.dart';

void main() {
  
  runApp( TelescopeApp(appRouter: AppRouter(),));
}

class TelescopeApp extends StatelessWidget {
  const TelescopeApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Telescope',
      onGenerateRoute:  appRouter.generateRoute,
    );
  }
}


