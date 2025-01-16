import 'package:flutter/material.dart';
import 'package:sample_app/provider_page_1.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/second_page.dart';
import 'package:sample_app/SliverAppBar.dart';

import 'provider_page_2.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case'/':
        if(args is String) {
          return MaterialPageRoute(
              builder: (_) => MyHomePage(title: args));
        }
        return MaterialPageRoute(builder: (_) => MyHomePage(title: "Kylas training"));
      case'/second':
        return MaterialPageRoute(builder: (_) => SecondRoute());
      case '/sliver':
        return MaterialPageRoute(builder: (_) => Sliver());
      case'/provider_page_1':
        return MaterialPageRoute(builder: (_) => ProviderPage1());
      case '/provider_page_2':
        return MaterialPageRoute(builder: (_) => ProviderPage2());
      default:
        return _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Unknown Error")
        ),
        body: Center(
          child: Text("Error"),
        ),
    ),
    );
  }
}