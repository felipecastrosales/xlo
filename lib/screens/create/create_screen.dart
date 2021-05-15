import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import '../../stores/create_store.dart';
import 'components/images_field.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();
  
  @override
  Widget build(BuildContext context) {
    final kLabelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 16);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 32,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * .85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagesField(createStore),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Título *',
                      labelStyle: kLabelStyle,
                      contentPadding: contentPadding,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Descrição *',
                      labelStyle: kLabelStyle,
                      contentPadding: contentPadding,
                    ),
                    maxLines: null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Preço *',
                      labelStyle: kLabelStyle,
                      contentPadding: contentPadding,
                      prefixText: 'R\$ ',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
