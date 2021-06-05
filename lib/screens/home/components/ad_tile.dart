import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../helpers/extensions.dart';
import '../../../models/ad.dart';
import '../../ad/ad_screen.dart';

class AdTile extends StatelessWidget {
  final Ad ad;
  const AdTile(this.ad);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AdScreen(ad)),
        );
      },
      child: Container(
        height: 130,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 130,
                width: 127,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/spinner-512.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ad.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${ad.created.formattedDate()} - '
                        '${ad.address.city.name} - '
                        '${ad.address.uf.initials}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
