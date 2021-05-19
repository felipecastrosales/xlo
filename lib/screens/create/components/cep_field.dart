import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/formatter/cep_input_formatter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../stores/cep_store.dart';
import '../../../stores/create_store.dart';

class CepField extends StatelessWidget {
  final CepStore cepStore;
  final CreateStore createStore;
  CepField(this.createStore) : cepStore = createStore.cepStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(
          builder: (_) {
            return TextFormField(
              onChanged: cepStore.setCep,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: 'CEP *',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
                errorText: createStore.addressError,
              ),
            );
          },
        ),
        Observer(
          builder: (_) {
            if (cepStore.address == null &&
                cepStore.error == null &&
                !cepStore.loading) {
              return Container();
            } else if (cepStore.address == null && cepStore.error == null) {
              return LinearProgressIndicator();
            } else if (cepStore.error != null) {
              return Container(
                alignment: Alignment.center,
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  cepStore.error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              );
            } else {
              final cep = cepStore.address;
              return Container(
                alignment: Alignment.center,
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Localização:'
                  '${cep.district}, ${cep.city.name} - ${cep.uf.initials}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
