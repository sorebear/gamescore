import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/add_dialog.dart';
import '../models/player.dart';
import '../scoped_models/players_model.dart';

class HomeScreen extends StatelessWidget {
  
  List<Widget> _renderButtons(int index, PlayersModel model, context) {
    return model.players.map((Player player) {
      return MaterialButton(
        // color: Colors.amber,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddDialog(player.name),
          );
        },
        child: index < model.longestListLength
            ? Text(player.numberAtIndex(index))
            : Text('+'),
      );
    }).toList();
  }

  List<Widget> _renderTotalScores(PlayersModel model) {
    return model.players.map((Player player) {
      return Container(
        padding: EdgeInsets.all(8),
        child: Text(player.totalScore.toString()),
      );
    }).toList();
  }

  List<Widget> _renderNames(PlayersModel model) {
    return model.players.map((Player player) {
      return Container(
        padding: EdgeInsets.all(8),
        child: Text(player.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PlayersModel>(
        builder: (BuildContext context, child, PlayersModel model) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 50,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: _renderNames(model),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 50,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _renderButtons(index, model, context),
                      );
                    },
                    childCount: model.longestListLength + 1,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.red,
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _renderTotalScores(model),
          ),
        ),
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
    });
  }
}
