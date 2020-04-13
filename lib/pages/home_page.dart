import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  final _scrollController = ScrollController();

  List<WordPair> _ls;

  @override
  void initState() {
    super.initState();
    print('home init.');
    _scrollController.addListener(onScroll);
    _ls = generateWordPairs().take(30).toList();
  }

  Future<void> onScroll() async {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      await Future.delayed(Duration(milliseconds: 1500));
      setState(() {
        _ls.addAll(generateWordPairs().take(30));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        child: ListView.separated(
          controller: _scrollController,
          itemCount: _ls.length + 1,
          itemBuilder: (context, i) {
            if(i == _ls.length) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.refresh,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5,),
                    Text('正在加载...',
                      style: TextStyle(
                        color: Colors.grey[600]
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 16),
                
              );
            }
            var obj = _ls[i];
            return ListTile(
              title: Text(_ls[i].asPascalCase),
              leading: LayoutBuilder(
                builder: (context, box) {
                  return Icon(
                    Icons.airplay,
                    size: box.biggest.height,
                  );
                },
              ),
              onTap: () {
                print(obj.asPascalCase);
              },
            );
          },
          separatorBuilder: (context, i) {
            return Divider();
          },
        ), 
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            _ls = generateWordPairs().take(30).toList();
          });
        }
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
