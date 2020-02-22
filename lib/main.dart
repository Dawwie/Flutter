import 'package:flutter/material.dart';
import 'package:flutter_workshop_1/games.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Games",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter workshops"),
      ),
      body: GamesPage(),
    );
  }
}

class SandboxPage extends StatefulWidget {
  @override
  _SandboxPageState createState() => _SandboxPageState();
}

class _SandboxPageState extends State<SandboxPage> {
  bool _checkboxValue = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter rocks!"),
            Checkbox(
              value: _checkboxValue,
              onChanged: (value) => setState(() => {_checkboxValue = value}),
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) => setState(() => {_switchValue = value}),
            ),
            RaisedButton(
              child: Text("Sure!"),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
