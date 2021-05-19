import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_store.dart';

class HidePhoneField extends StatelessWidget {
  final CreateStore createStore;
  const HidePhoneField(this.createStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(
            builder: (_) {
              return Checkbox(
                value: createStore.hidePhone,
                onChanged: createStore.setHidePhone,
              );
            },
          ),
          Expanded(
            child: Text(
              'Ocultar o meu telefone neste anúncio',
            ),
          ),
        ],
      ),
    );
  }
}
