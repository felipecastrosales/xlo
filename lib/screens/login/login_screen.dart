import 'package:flutter/material.dart';

import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar',),
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
                  Text(
                    'Acessar com e-mail', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ), 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 8, 0, 4),
                    child: Text(
                      'E-mail', 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextField(
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true, 
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha', 
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Text(
                            'Esqueceu sua senha?', 
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {

                      },
                      color: Colors.orange,
                      child: Text('ENTRAR'),
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[700]),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      alignment: WrapAlignment.center, 
                      children: [
                        const Text(
                          'Não tem uma conta?  ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SignUpScreen())
                            );
                          },
                          child: Text(
                            'Cadastre-se',
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