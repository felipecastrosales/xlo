import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get_it/get_it.dart';

import '../../../stores/page_store.dart';

class CreateAdButton extends StatefulWidget {
  final ScrollController scrollController;
  const CreateAdButton(this.scrollController);

  @override
  _CreateAdButtonState createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton>
with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> buttonAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.4, 0.6)),
    );
    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    print('eaiiii');
    final scroll = widget.scrollController.position;
    if (scroll.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonAnimation, 
      builder: (_, __) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,
            margin: EdgeInsets.only(bottom: buttonAnimation.value),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                elevation: 0, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.camera_alt, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Anunciar agora',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                GetIt.I<PageStore>().setPage(1);
              },
            ),
          ),
        );
      },  
    );
  }
}
