import 'package:flutter/material.dart';

import '../../stores/my_ads_store.dart';

class MyAdsScreen extends StatefulWidget {
  final int initialPage;
  MyAdsScreen({this.initialPage = 0});

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
with SingleTickerProviderStateMixin {

  final MyAdsStore store = MyAdsStore();
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(color: Colors.grey),
          Container(color: Colors.green),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}