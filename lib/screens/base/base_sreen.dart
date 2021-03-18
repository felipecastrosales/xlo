import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/page_store.dart';
import '../create/create_screen.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => pageStore.page, pageController.jumpToPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(color: Colors.yellow),
          Container(color: Colors.purple),
          Container(color: Colors.brown),
        ],
      ),
    );
  }
}
