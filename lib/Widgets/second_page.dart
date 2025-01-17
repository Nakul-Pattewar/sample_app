import 'package:flutter/material.dart';
import 'package:sample_app/Constants/strings.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(1000, (index) => ('item ${index + 1}'));
    return Scaffold(
      appBar: AppBar(
        title: const Text(secondPageTitle),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text(items[index][5]),
                  ),
                  title: Text(items[index]),
                  subtitle: Text(numbersListItemSubtitle + items[index].toString(),),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(numbersListSnackBarText + items[index].toString(),),),);
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(backButtonText),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/random");
            },
            child: const Text(randomPageTitle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/sliver");
            },
            child: const Text(sliverAppBarTitle),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/provider_page_1");
            },
            child: const Text(numbersListPage1Title),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/provider_page_2");
            },
            child: const Text(numbersListPage2Title),
          ),
        ]),
      ),
    );
  }
}
