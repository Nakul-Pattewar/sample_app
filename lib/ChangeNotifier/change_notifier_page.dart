import 'package:flutter/material.dart';
import 'package:sample_app/Constants/strings.dart';
import 'list_model.dart';

class ListListenableBuilder extends StatelessWidget {
  ListListenableBuilder({super.key});

  final ListModel _listNotifier = ListModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _listNotifier,
      builder: (context, child) => Scaffold(
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
                itemCount: _listNotifier.notifierList.length,
                itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(_listNotifier.notifierList[index].toString()),
                    ),
                    title: Text(_listNotifier.notifierList[index].toString()),
                    subtitle: Text(
                      numbersListItemSubtitle +
                          _listNotifier.notifierList[index].toString(),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            numbersListSnackBarText +
                                _listNotifier.notifierList[index].toString(),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('**** onPressed');
                _listNotifier.addNumber();
              },
              child: Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
