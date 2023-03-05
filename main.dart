import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  List<Widget> _buildCounters() {
    List<Widget> counters = [];

    for (int i = 0; i < 3; i++) {
      counters.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter ${i + 1}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decrementCounter,
                  icon: Icon(Icons.remove),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 24.0),
                ),
                IconButton(
                  onPressed: _incrementCounter,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ));
    }

    return counters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Counters',
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildCounters(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSnackBar('This is a snackbar used for the ScaffolfMeassages.'),
        tooltip: 'Show Snackbar',
        child: Icon(Icons.info_outline),
      ),
    );
  }
}
