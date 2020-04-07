import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('personal init.');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal'),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text('Item$i title'),
              subtitle: Text('Item$i subtitle'),
              leading: Icon(Icons.alarm),
            );
          })
    );
  }

  @override
  bool get wantKeepAlive => true;
}