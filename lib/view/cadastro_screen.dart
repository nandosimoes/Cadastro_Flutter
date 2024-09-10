import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'visualizar_screen.dart';

class CadastroScreen extends StatefulWidget {
  @override
  CadastroScreenState createState() => CadastroScreenState();
}

class CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  String? genero;
  final List<UserModel> usuarios = [];

  void salvarUsuario() {
    if (nomeController.text.isEmpty ||
        emailController.text.isEmpty ||
        telefoneController.text.isEmpty ||
        enderecoController.text.isEmpty ||
        genero == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {

      usuarios.add(UserModel(
      
        nome: nomeController.text,
        email: emailController.text,
        telefone: telefoneController.text,
        endereco: enderecoController.text,
        genero: genero!,
      ));
      nomeController.clear();
      emailController.clear();
      telefoneController.clear();
      enderecoController.clear();
      genero = null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastrado com Sucesso'),
          backgroundColor: Color.fromARGB(144, 0, 255, 0),
        ),
      );
    });
  }

  void verInfo() {
    if (usuarios.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nenhum usuário cadastrado'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisualizarScreen(usuarios: usuarios)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              controller: enderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Gênero:'),
                Radio<String>(
                  value: 'Masculino',
                  groupValue: genero,
                  onChanged: (value) {
                    setState(() {
                      genero = value;
                    });
                  },
                ),
                Text('Masculino'),
                Radio<String>(
                  value: 'Feminino',
                  groupValue: genero,
                  onChanged: (value) {
                    setState(() {
                      genero = value;
                    });
                  },
                ),
                Text('Feminino'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: salvarUsuario,
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: verInfo,
                  child: Text('Ver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
