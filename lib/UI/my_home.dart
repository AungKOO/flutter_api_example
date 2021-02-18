import 'package:flutter/material.dart';
import 'package:flutter_api_example/network/api_service.dart';
import 'package:flutter_api_example/network/model/photo_model.dart';
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
          child: _listFuturePhotos(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = Provider.of<ApiService>(context, listen: false)
              .getPhotos()
              .then((value) => value.forEach((element) {
                    // print(element.title);
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

FutureBuilder _listFuturePhotos(BuildContext context) {
  return FutureBuilder<List<PhotoModel>>(
      future: Provider.of<ApiService>(context, listen: false).getPhotos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PhotoModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Something Wrong"),
              ),
            );
          }
          final photos = snapshot.data;
          return _listPhotos(context: context, photos: photos);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}

ListView _listPhotos({BuildContext context, List<PhotoModel> photos}) {
  return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network(photos[index].url),
              title: Text(photos[index].title),
            ),
          ),
        );
      });
}
