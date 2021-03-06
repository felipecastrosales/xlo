import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import '../../stores/create_store.dart';
import '../../stores/page_store.dart';
import '../signup/components/error_box.dart';
import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final CreateStore createStore = CreateStore();

  @override
  void initState() {
    super.initState();
    when((_) => createStore.savedAd, () {
      GetIt.I<PageStore>().setPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final kLabelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 16);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 32,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * .85,
              child: Observer(
                builder: (_) {
                  if (createStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Salvando Anúncio',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImagesField(createStore),
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: createStore.setTitle,
                              decoration: InputDecoration(
                                labelText: 'Título *',
                                labelStyle: kLabelStyle,
                                contentPadding: contentPadding,
                                errorText: createStore.titleError,
                              ),
                            );
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: createStore.setDescription,
                              decoration: InputDecoration(
                                labelText: 'Descrição *',
                                labelStyle: kLabelStyle,
                                contentPadding: contentPadding,
                                errorText: createStore.descriptionError,
                              ),
                              maxLines: null,
                            );
                          },
                        ),
                        CategoryField(createStore),
                        CepField(createStore),
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              onChanged: createStore.setPrice,
                              decoration: InputDecoration(
                                labelText: 'Preço *',
                                labelStyle: kLabelStyle,
                                contentPadding: contentPadding,
                                prefixText: 'R\$ ',
                                errorText: createStore.priceError,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                RealInputFormatter(centavos: true),
                              ],
                            );
                          },
                        ),
                        HidePhoneField(createStore),
                        Observer(
                          builder: (_) {
                            return ErrorBox(message: createStore.error);
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return SizedBox(
                              height: 50,
                              child: GestureDetector(
                                onTap: createStore.invalidSendPressed,
                                child: ElevatedButton(
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    onSurface: Colors.orange.withAlpha(120),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: createStore.sendPressed,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
