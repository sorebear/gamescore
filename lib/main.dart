import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _player1Score = [10, 20, 15, 5];
  List<int> _player2Score = [5, 10];

  int _calculateScore(List<int> numbers) {
    int _total = 0;
    numbers.forEach((number) => _total += number);
    return _total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.amber,
                      onPressed: () {},
                      child: Text(_player1Score.length > index
                          ? _player1Score[index].toString()
                          : ''),
                    ),
                    MaterialButton(
                      color: Colors.amber,
                      onPressed: () {},
                      child: Text(_player2Score.length > index
                          ? _player2Score[index].toString()
                          : ''),
                    ),
                  ]);
            }),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.red,
      //   height: 100,
      //   child: Row(
      //     children: <Widget>[
      //       Container(child: Text(_calculateScore(_player1Score).toString())),
      //       Container(child: Text(_calculateScore(_player2Score).toString())),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (BuildContext bc) => Container(
              color: Colors.grey[900],
              height: 250,
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
