import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Constants/strings.dart';
import 'package:sample_app/Provider/list_provider.dart';

class NumbersListPage2 extends StatelessWidget {
  const NumbersListPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, numbersListProviderModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text(numbersListPage2Title),
                backgroundColor: Colors.teal,
              ),
              body: Center(
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: numbersListProviderModel.numbersList.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text(index <
                                    numbersListProviderModel.numbersList.length
                                ? numbersListProviderModel.numbersList[index]
                                    .toString()
                                : ''),
                          ),
                          title: Text(numbersListProviderModel
                              .numbersList[index]
                              .toString()),
                          subtitle: Text(
                            numbersListItemSubtitle +
                                numbersListProviderModel.numbersList[index]
                                    .toString(),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  numbersListSnackBarText +
                                      numbersListProviderModel
                                          .numbersList[index]
                                          .toString(),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      numbersListProviderModel.add();
                    },
                    child: Icon(Icons.add),
                  ),
                ]),
              ),
            ));
  }
}
