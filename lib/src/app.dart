import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'screens/home.dart';
import 'scoped_models/players_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<PlayersModel>(
      model: PlayersModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
