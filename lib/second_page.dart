import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(1000, (index) => ('item ${index + 1}'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
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
                    subtitle: Text('Subtitle for ${items[index]}'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tapped on ${items[index]}')));
                    }),
              ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/random");
            },
            child: const Text('Random page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/sliver");
            },
            child: const Text('sliver AppBar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/provider_page_1");
            },
            child: const Text('provider_page_1'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/provider_page_2");
            },
            child: const Text('provider_page_2'),
          ),
        ]),
      ),
    );
  }
}
