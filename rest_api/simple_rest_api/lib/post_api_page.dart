import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostApiPage extends StatefulWidget {
  const PostApiPage({Key? key}) : super(key: key);

  @override
  State<PostApiPage> createState() => _PostApiPageState();
}

class _PostApiPageState extends State<PostApiPage> {
  String baseUrl = 'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api';

  Future postLogin() async {
    try {
      String urlLogin = '$baseUrl/v1/auth/login';

      var data = {'email': 'deveda4217@logodez.com', 'password': 'Teste@123'};
      var response = await Dio().post(urlLogin, data: data);

      print(response.data);
    } catch (e) {
      print('Deu erro na requisiçao $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests Post'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postLogin();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
