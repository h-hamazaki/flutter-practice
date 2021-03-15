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
            transitionButton(context, "Stateful", Colors.red, () => Navigator.pushNamed(context, "/stateful")),
            transitionButton(context, "Stateless", Colors.blue, () => Navigator.pushNamed(context, "/stateless")),
            transitionButton(context, "Provider", Colors.green, () => Navigator.pushNamed(context, "/provider")),
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
