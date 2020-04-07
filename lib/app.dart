import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/personal_page.dart';

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
  final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text('我的')),
  ];

  final _pages = <Widget>[HomePage(), PersonalPage()];

  final _pageController = PageController();

  int _pageIndex = 0;

  void onTap(int index) {
    _pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: _pages,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          items: _items,
          onTap: onTap,
        ));
  }
}
