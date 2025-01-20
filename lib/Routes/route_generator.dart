import 'package:flutter/material.dart';
import 'package:sample_app/ChangeNotifier/change_notifier_page.dart';
import 'package:sample_app/Constants/strings.dart';
import 'package:sample_app/Provider/numbers_list_page_1.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/Widgets/second_page.dart';
import 'package:sample_app/Widgets/SliverAppBar.dart';

import '../Provider/numbers_list_page_2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyHomePage(title: args),
          );
        }
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: homePageTitle),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondRoute(),
        );
      case '/sliver':
        return MaterialPageRoute(
          builder: (_) => Sliver(),
        );
      case '/provider_page_1':
        return MaterialPageRoute(
          builder: (_) => NumbersListPage1(),
        );
      case '/provider_page_2':
        return MaterialPageRoute(
          builder: (_) => NumbersListPage2(),
        );
      case '/changeNotifier':
        return MaterialPageRoute(builder: (_) => ListListenableBuilder(),
    );
      default:
        return _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(unknownErrorText),
        ),
        body: Center(
          child: Text(unknownErrorData),
        ),
      ),
    );
  }
}
