import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_store.dart';
import 'image_source_modal.dart';

class ImagesField extends StatelessWidget {
  final CreateStore createStore;
  const ImagesField(this.createStore);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStore.images.add(image);
      Navigator.of(context).pop();
    };
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: createStore.images.length < 3 
                ? createStore.images.length + 1 : 5,
            itemBuilder: (_, index) {
              if (index == createStore.images.length) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid) {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => ImageSourceModel(onImageSelected),
                        );
                      } else {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (_) => ImageSourceModel(onImageSelected),
                        );
                      }
                    },
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.camera_alt, size: 40, color: Colors.grey,
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding:  EdgeInsets.fromLTRB(
                      8, 16, index == 4 ? 8 : 0, 16),
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 44, 
                      backgroundImage: FileImage(createStore.images[index]),
                    ),
                  ),
                ); 
              }
            },
          );
        },
      ),
    );
  }
}
