import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Constants/strings.dart';
import 'package:sample_app/Provider/list_provider.dart';

class NumbersListPage1 extends StatelessWidget {
  const NumbersListPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, numbersListProvider, child) => Scaffold(
              appBar: AppBar(
                title: const Text(numbersListPage1Title),
                backgroundColor: Colors.blueAccent,
              ),
              body: Center(
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: numbersListProvider.numbersList.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text(numbersListProvider.numbersList[index]
                                .toString()),
                          ),
                          title: Text(numbersListProvider.numbersList[index]
                              .toString()),
                          subtitle: Text(
                            numbersListItemSubtitle +
                                numbersListProvider.numbersList[index]
                                    .toString(),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  numbersListSnackBarText +
                                      numbersListProvider.numbersList[index]
                                          .toString(),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      numbersListProvider.add();
                    },
                    child: Icon(Icons.add),
                  ),
                ]),
              ),
            ));
  }
}
