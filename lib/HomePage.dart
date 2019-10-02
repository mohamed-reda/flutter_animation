import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/ProviderOfHome.dart';
import 'package:flutter_animation/page1.dart';
import 'package:flutter_animation/page2.dart';
import 'package:flutter_animation/page3.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> _widgetOptions = <Widget>[
  Page1(),
  Page2(),
  Page3(),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    ProviderOfHome providerOfHome = Provider.of<ProviderOfHome>(context);

    return MultiProvider(
      providers: [
//        ChangeNotifierProvider<ProviderOfCategory>.value(
//          value: ProviderOfCategory(),
//        ),
        ChangeNotifierProvider(builder: (_) =>
          ProviderOfHome(),
        ),
      ],
      //
      //
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Reda'),
          ),
          body: Center(
            child: _widgetOptions[providerOfHome.getIndex()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sync),
              ),
            ],
            currentIndex: providerOfHome.getIndex(),
            selectedItemColor: Colors.amber[800],
            onTap: (selectedIndex) {
              providerOfHome.setIndex(selectedIndex);
            },
            backgroundColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            unselectedItemColor: Colors.grey,
//    unselectedFontSize: 10,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
