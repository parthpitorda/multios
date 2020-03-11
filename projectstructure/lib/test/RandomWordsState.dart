import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> _suggesutions = <WordPair>[];
  Set<WordPair> _saved = Set<WordPair>();
  TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    Socket.connect("google.com", 80).then((socket) {
      print('Connected to: '
          '${socket.remoteAddress.address}:${socket.remotePort}');
      socket.destroy();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Random words.."),
        leading: IconButton(
          icon: Icon(Icons.local_parking),
          onPressed: _popupMenu,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_parking),
            onPressed: _popupMenu,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          alreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: new EdgeInsets.all(10),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggesutions.length) {
            _suggesutions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggesutions[index]);
        });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Saved Suggestions.."),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget _popupMenu() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("item 1"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("item 2"),
            value: 2,
          ),
        ],
        onSelected: (value) => print("you selected $value"),
      );
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}
