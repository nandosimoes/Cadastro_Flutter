import 'package:flutter/material.dart';
import '../model/user_model.dart';
class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/456/456212.png',
                  
                  width: 50, 
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${user.nome}'),
                  Text('Email: ${user.email}'),
                  Text('Telefone: ${user.telefone}'),
                  Text('Endereço: ${user.endereco}'),
                  Text('Gênero: ${user.genero}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
