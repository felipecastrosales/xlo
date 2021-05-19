import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/formatter/cep_input_formatter.dart';
import '../../../stores/cep_store.dart';

class CepField extends StatelessWidget {
  final CepStore cepStore = CepStore();
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}