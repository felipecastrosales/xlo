import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../../models/ad.dart';
import 'components/main_panel.dart';

class AdScreen extends StatelessWidget {
  final Ad ad;
  const AdScreen(this.ad);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        centerTitle: true,
        actions: [],
      ),
      body: ListView(
        children: [
          Container(
            height: 280,
            child: Carousel(
              images: ad.images.map(
                  (url) => CachedNetworkImageProvider(url)).toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotColor: Colors.orange,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainPanel(ad),
                Divider(color: Colors.grey[500]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
