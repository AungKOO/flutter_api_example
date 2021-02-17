import 'package:flutter/material.dart';
import 'package:flutter_api_example/network/api_service.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  final String title;
  MyHome({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: Text('Flutter API testing'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = Provider.of<ApiService>(context, listen: false)
              .getPhotos()
              .then((value) => value.forEach((element) {
                    print(element.title);
                  }))
              .catchError((onError) {
            print(onError.toString());
          });
        },
        child: Icon(
          Icons.terrain_rounded,
        ),
      ),
    );
  }
}
