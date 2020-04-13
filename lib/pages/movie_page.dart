import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Theme(
          data: ThemeData(
            primaryColor: Color.fromRGBO(247, 91, 67, 1.0),
            hintColor: Color(0xFFC5C5C5),
            accentColor: Color(0xFF7C7C7C),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: SearchBar(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hintColor = Theme.of(context).hintColor;
    var accentColor = Theme.of(context).accentColor;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40.0),
            child: TextField(
              style: TextStyle(color: accentColor),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                hintText: '请输入搜索内容',
                prefixIcon: Icon(Icons.search, color: hintColor),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
                  child: Icon(Icons.mic_none, color: hintColor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Color(0xFFF0F0F0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        IconButton(icon: Icon(Icons.missed_video_call), onPressed: null)
      ],
    );
  }
}
