import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../models/ad.dart';

class BottomBar extends StatelessWidget {
  final Ad ad;
  BottomBar(this.ad);

  @override
  Widget build(BuildContext context) {
    final kTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                if (!ad.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final phone =
                            ad.user.phone.replaceAll(RegExp('[^0-9]'), '');
                        launch('tel: $phone');
                      },
                      child: Container(
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black45),
                          ),
                        ),
                        child: Text('Ligar', style: kTextStyle),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Container()),
                      );
                    },
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      child: Text('Chat', style: kTextStyle),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              border: Border(top: BorderSide(color: Colors.grey[400])),
            ),
            height: 38,
            alignment: Alignment.center,
            child: Text(
              '${ad.user.name} - anunciante',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
