import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_source_modal.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ImageSourceModel(),
                  );
                } else {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => ImageSourceModel(),
                  );
                }
              },
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
