import 'package:flutter/material.dart';

class ShrikWrapEx extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'key': 'item 1', 'value': 'description 1'},
    {'key': 'item 2', 'value': 'description 2'},
    {'key': 'item 3', 'value': 'description 3'},
    {'key': 'item 4', 'value': 'description 4'},
    {'key': 'item 5', 'value': 'description 5'},
    {'key': 'item 6', 'value': 'description 6'},
    {'key': 'item 7', 'value': 'description 7'},
    {'key': 'item 8', 'value': 'description 8'},
    {'key': 'item 9', 'value': 'description 9'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('shrinkWrap'),
        elevation: 5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: items.length,
        itemBuilder: (context, idx) {
          return Card(
            margin: EdgeInsets.only(
              top: 20.0,
              bottom: (idx + 1) >= items.length ? 50.0 : 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(width: 0.05),
            ),
            elevation: 7,
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    leading: CircleAvatar(
                      child: Text((idx + 1).toString()),
                    ),
                    title: Text(items[idx]['key']),
                    subtitle: Text(items[idx]['value']),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'TEST',
                      style: TextStyle(fontSize: 30, color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
