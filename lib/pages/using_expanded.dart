import 'package:flutter/material.dart';
import 'package:scroll_ex/models/post.dart';
import 'package:scroll_ex/service/json_placehodler.dart';
import 'package:scroll_ex/widgets/header.dart';

class UsingExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Expanded'),
      ),
      body: Column(
        children: <Widget>[
          Header(),
          FutureBuilder(
            future: JsonPlaceholder.getPosts(),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = snapshot.data[index];
                      return Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            leading: CircleAvatar(
                              child: Text((index + 1).toString()),
                            ),
                            title: Text(item.title),
                            subtitle: Text(item.body),
                          ),
                          Divider(
                            color: Colors.black45,
                            height: 1,
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
