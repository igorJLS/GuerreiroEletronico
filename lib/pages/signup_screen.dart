import 'package:flutter/material.dart';
import 'package:tcc/pages/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerCategoria = TextEditingController();

  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Cliente', 'Cozinha', 'Gerente', 'Garçom'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.6,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(250, 253, 253, 253),
                      Color.fromARGB(234, 24, 15, 15),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "lib/assets/images/logo.png",
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                            fontSize: (13),
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 5)
                        ]),
                    child: Form(
                      key: _form,
                      child: TextFormField(
                        controller: controllerName,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: "Nome"),
                        onSaved: (value) => _formData['Nome'] = value!,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerSenha,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.key),
                          hintText: "Senha"),
                      onSaved: (value) => _formData['Senha'] = value!,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: controllerEmail,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.email),
                          hintText: "Email"),
                      onSaved: (value) => _formData['Email'] = value!,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 280,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      items: dropOpcoes
                          .map((opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ))
                          .toList(),
                      onChanged: (escolha) =>
                          dropValue.value = escolha.toString(),
                      hint: const Text('Escolha a categoria'),
                      value: (value.isEmpty) ? null : value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  );
                }),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(234, 24, 15, 15),
                    Color.fromARGB(250, 253, 253, 253),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Cadastre",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset("lib/assets/images/gravata.png"),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
