import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/list_provider.dart';

class ProviderPage1 extends StatelessWidget {
  const ProviderPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider> (builder: (context,numbersListProvider,child)=>Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page 1'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 600,
            child: Expanded(child: ListView.builder(
              itemCount: numbersListProvider.numbersList.length,
              itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text(numbersListProvider.numbersList[index].toString()),
                  ),
                  title: Text(numbersListProvider.numbersList[index].toString()),
                  subtitle: Text('Subtitle for ${numbersListProvider.numbersList[index]}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${numbersListProvider.numbersList[index]}')));
                  }),
            ),
          ),),

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
