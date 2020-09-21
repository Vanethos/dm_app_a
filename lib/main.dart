import 'package:flutter/material.dart';
import 'package:lib_a/lib_a.dart';
import 'package:lib_b/lib_b.dart';
import 'package:lib_c/lib_c.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependency Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dependency Management Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  LibraryA libA;
  
  LibraryB libB;

  LibraryC libC;
  
  @override
  void initState() {
    super.initState();

    libC = LibraryC();

    libA = LibraryA(libC);

    libB = LibraryB(libC);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Dependencies:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(libA.name),
            Text(libB.name),
            Text(libC.name),
          ],
        ),
      ),
    );
  }
}
