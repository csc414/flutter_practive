import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final _pages = <Widget>[HomePage(), PersonalPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarProvider(
      child: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text('我的')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}

class BottomNavigationBarProvider extends InheritedWidget {
  final BottomNavigationBar bottomNavigationBar;

  BottomNavigationBarProvider(
      {Key key, @required this.bottomNavigationBar, Widget child})
      : super(key: key, child: child);

  static BottomNavigationBarProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BottomNavigationBarProvider>();
  }

  @override
  bool updateShouldNotify(BottomNavigationBarProvider oldWidget) {
    return bottomNavigationBar != oldWidget.bottomNavigationBar;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBarProvider.of(context).bottomNavigationBar,
    );
  }
}

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBarProvider.of(context).bottomNavigationBar,
    );
  }
}
