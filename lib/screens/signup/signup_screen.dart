import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            elevation: 32,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * .85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldTitle(
                    title: 'Apelido',
                    subtitle: 'Como aparecerá em seus anúncios.'
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Exemplo: Felipe Sales', 
                      isDense: true, 
                    ),
                  ),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confirmação.'
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Exemplo: soufeliposales@gmail.com', 
                      isDense: true, 
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja a sua conta.'
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Exemplo: (85) 99999-9999', 
                      isDense: true, 
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letras, números e caracteres especiais.'
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true, 
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Confirmar senha',
                    subtitle: 'Repita a senha.'
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true, 
                    ),
                    obscureText: true,
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 20, bottom: 12),
                    child: RaisedButton(
                      onPressed: () {

                      },
                      color: Colors.orange,
                      child: Text('CADASTRAR'),
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[700]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center, 
                      children: [
                        const Text(
                          'Já tem uma conta?  ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
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