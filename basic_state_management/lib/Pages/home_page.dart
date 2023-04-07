import 'package:basic_state_management/Provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountState(),
      child: Consumer<CountState>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: value.isWhite ? Colors.white : Colors.amber,
            appBar: AppBar(
              title: Text(value.title),
              leading: IconButton(
                icon: Icon(Icons.mail),
                onPressed: () =>
                    Provider.of<CountState>(context, listen: false).decrement(),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                icon: Icon(Icons.perm_camera_mic),
                onPressed: () =>
                    Provider.of<CountState>(context, listen: false).toggleColor(),
              ),
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    value.count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Provider.of<CountState>(context, listen: false).increament(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}
