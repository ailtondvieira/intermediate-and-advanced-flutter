import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusCep = FocusNode();
  FocusNode focusRua = FocusNode();

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register-se'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Nome'),
              onSubmitted: (value) => focusEmail.requestFocus(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: focusEmail,
              decoration: const InputDecoration(hintText: 'E-mail'),
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value!.length < 6) {
                  return 'A senha precisa ter mais do que 6 caracteres';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                focusCep.requestFocus();
              },
              // onSubmitted: (value) => focusCep.requestFocus(),
            ),
            const SizedBox(height: 20),
            TextField(
              focusNode: focusCep,
              decoration: const InputDecoration(hintText: "Cep"),
              onSubmitted: (value) => focusRua.requestFocus(),
            ),
            const SizedBox(height: 20),
            TextField(
              focusNode: focusRua,
              decoration: const InputDecoration(hintText: "Rua"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  print('Tá validado');
                  // Requisição
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Você precisa preencher os dados corretamente',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
