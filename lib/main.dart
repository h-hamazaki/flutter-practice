import 'package:benkyokai/screens/provider_test/provider_test_screen.dart';
import 'package:benkyokai/screens/stateful_widget_screen.dart';
import 'package:benkyokai/screens/stateless_widget_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/stateful': (BuildContext context) => MyStatefulScreen(title: 'This Is StatefulWidget'),
        '/stateless': (BuildContext context) => MyStatelessScreen(title: 'This Is StatelessWidget'),
        '/provider': (BuildContext context) => ProviderTestScreen(title: 'This Is Provider'),
        '/test': (BuildContext context) => TestScreen(),
      },
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.yellow[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            transitionButton(context, "Stateful", Colors.red,
                () => Navigator.pushNamed(context, "/stateful", arguments: "hogehoge")),
            transitionButton(context, "Stateless", Colors.blue, () => Navigator.pushNamed(context, "/stateless")),
            transitionButton(context, "Provider", Colors.green, () => Navigator.pushNamed(context, "/provider")),
            transitionButton(context, "Test", Colors.purple, () => Navigator.pushNamed(context, "/test")),
          ],
        ),
      ),
    );
  }

  Widget transitionButton(BuildContext context, String headerTitle, Color themeColor, VoidCallback callback) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          onPressed: callback, color: themeColor, child: Text(headerTitle, style: TextStyle(color: Colors.white))),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 80.0, color: Colors.red),
            Container(height: 80.0, color: Colors.red[400]),
            Container(height: 80.0, color: Colors.red[300]),
            Container(
              height: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 80.0, color: Colors.blue),
                  Container(width: 80.0, color: Colors.blue[400]),
                  Container(width: 80.0, color: Colors.blue[300]),
                  Container(width: 80.0, color: Colors.blue[200]),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text("This is Button"),
              color: Colors.yellow,
              onPressed: () {
                debugPrint("Pushed!!!");
              },
            ),
            SizedBox(height: 20.0),
            Text("BIG TEXT", style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Colors.green,
        child: Text("This is Bottom Area"),
      ),
    );
  }
}
