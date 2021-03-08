import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';

import '../../stores/signup_store.dart';
import 'components/error_box.dart';
import 'components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpStore signUpStore = SignUpStore();

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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ErrorBox(
                            message: signUpStore.error,
                          ),
                        );
                      },
                    ),
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.'
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Exemplo: Felipe Sales',
                            isDense: true,
                            errorText: signUpStore.nameError,
                          ),
                          onChanged: signUpStore.setName,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.'),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'soufeliposales@gmail.com',
                            isDense: true,
                            errorText: signUpStore.emailError,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          onChanged: signUpStore.setEmail,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Telefone', 
                      subtitle: 'Proteja a sua conta.',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: '(85) 99999-9999',
                            isDense: true,
                            errorText: signUpStore.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: signUpStore.setPhone,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais.',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signUpStore.pass1Error,
                          ),
                          obscureText: true,
                          onChanged: signUpStore.setPass1,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Confirmar senha', 
                      subtitle: 'Repita a senha.',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signUpStore.pass2Error,
                          ),
                          obscureText: true,
                          onChanged: signUpStore.setPass2,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(100),
                            child: signUpStore.loading
                                ? CircularProgressIndicator()
                                : Text('CADASTRAR'),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onPressed: signUpStore.signUpPressed,
                          ),
                        );
                      },
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
      ),
    );
  }
}
