import 'package:flutter/cupertino.dart';
class ImageModel{
  int id;
  String url;
  int albumId;
  String title;

  ImageModel.fromJson(Map<String, dynamic>jsonData):
    id = jsonData['id'],
    url = jsonData['url'],
    albumId = jsonData['albumId'],
    title = jsonData['title'];

  ImageModel(this.id, this.url, this.albumId, this.title);

  String toString(){
    return ('${'\n' +'id: $id'  + ' url: $url' + 'title: $title'}');
  }

}