import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

import '../repositories/ad_repository.dart';
import 'user_manager_store.dart';

part 'my_ads_store.g.dart';

class MyAdsStore = _MyAdsStoreBase with _$MyAdsStore;

abstract class _MyAdsStoreBase with Store {
  _MyAdsStoreBase() {
    _getMyAds();
  }

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;
    AdRepository().getMyAds(user);
  }
}
