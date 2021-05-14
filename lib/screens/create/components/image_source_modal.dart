import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              child: const Text('Câmera'),
              onPressed: getFromCamera,
            ),
            TextButton(
              child: const Text('Galeria'),
              onPressed: getFromGallery,
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: getFromGallery,
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera);
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery);    
    imageSelected(File(pickedFile.path));
  }

  void imageSelected(File image) {
    print(image.path);
  }
}
