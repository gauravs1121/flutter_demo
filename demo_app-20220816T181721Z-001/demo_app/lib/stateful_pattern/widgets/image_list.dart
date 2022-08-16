import 'package:demo_app/stateful_pattern/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
ImageList(this.imageList);

  final List<ImageModel> imageList;

  /// * Listview.builder is used for pagination
  /// Border is important for padding
  /// which is achieved by @BoxDecoration

  @override
  Widget build(context) => ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, int index) {
          return showRowUiData(imageList[index]);
        },
      );

  Widget showRowUiData(ImageModel imageList) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0
      ),
      margin: const EdgeInsets.only(
          top: 8,
          right: 8,
          left: 8
      ),
      child: Column(
        children: [
          Padding(child:
          Image.network(imageList.url),
          padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(
            imageList.title,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}
