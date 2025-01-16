import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/list_provider.dart';

class ProviderPage2 extends StatelessWidget {
  const ProviderPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider> (builder: (context,numbersListProviderModel,child)=>Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page 2'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 300,
            child: Expanded(child: ListView.builder(
              itemCount: numbersListProviderModel.numbersList.length,
              itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text(index<numbersListProviderModel.numbersList.length ? numbersListProviderModel.numbersList[index].toString() : ''),
                  ),
                  title: Text(numbersListProviderModel.numbersList[index].toString()),
                  subtitle: Text('Subtitle for ${numbersListProviderModel.numbersList[index]}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${numbersListProviderModel.numbersList[index]}')));
                  }
                  ),
            ),
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
