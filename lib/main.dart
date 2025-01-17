import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Constants/strings.dart';
import 'package:sample_app/Provider/list_provider.dart';
import 'Routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumbersListProvider())
      ],
      child: MaterialApp(
        title: homePageTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              border: Border.all(width: 4),
              borderRadius: BorderRadiusDirectional.all(Radius.circular(23))),
          child: Scrollbar(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 4),
              borderRadius: BorderRadiusDirectional.all(Radius.circular(23))),
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              Container(
                width: 100,
                color: Colors.amber,
                child: ListView(
                  children: [
                    Container(
                      height: 20,
                      margin: const EdgeInsets.all(20),
                      child: Text('abc'),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                      ),
                      child: Text('abc'),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                      ),
                      child: Text('abc'),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                      ),
                      child: Text('abc'),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                      ),
                      child: Text('abc'),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                color: Colors.green,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.teal,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.green,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.amber,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.green,
                child: Text('abc'),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: Text('abc'),
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/second", arguments: numbersListPage2Title);
            },
            child: const Text(nextPageButtonText))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
