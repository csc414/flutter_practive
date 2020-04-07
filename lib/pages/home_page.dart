import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() { 
    super.initState();
    print('home init.');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text('Item$i title'),
              subtitle: Text('Item$i subtitle'),
              leading: Icon(Icons.airplay),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}