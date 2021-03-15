import 'package:benkyokai/screens/provider_test/provider_test_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestScreen extends StatelessWidget {
  final String title;
  ProviderTestScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderTestChangeNotifier>(
      create: (BuildContext context) => ProviderTestChangeNotifier(),
      builder: (BuildContext context, Widget child) {
        final vm = context.watch<ProviderTestChangeNotifier>();
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Counter:'),
                Text(
                  '${vm.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              vm.counter = 1;
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
