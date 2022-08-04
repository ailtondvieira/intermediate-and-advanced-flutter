import 'package:brasil_fields/brasil_fields.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_api_with_models/cep_model.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final cepController = TextEditingController();
  final cepFocusNode = FocusNode();

  CepModel? cepModel;
  Future<CepModel?> getInfoByCep() async {
    try {
      String cep = cepController.text.replaceAll(RegExp('[^0-9]'), '');

      if (cep.length >= 8) {
        var url = 'https://viacep.com.br/ws/$cep/json/';

        final response = await Dio().get(url);
        if (response.data['erro'] != "true") {
          return CepModel.fromMap(response.data);
        }
      }
    } catch (e) {
      print('Deu erro $e');
    } finally {
      setState(() {});
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests Get'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              focusNode: cepFocusNode,
              controller: cepController,
              decoration: const InputDecoration(
                hintText: 'Coloque seu cep',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const SizedBox(height: 30),
            FutureBuilder(
              future: getInfoByCep(),
              builder: (context, AsyncSnapshot<CepModel?> snapshot) {
                if (snapshot.data == null) {
                  cepModel = null;
                  return const Text('Nenhum resultado ainda.');
                }

                cepModel = snapshot.data;

                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.home_work_outlined,
                              size: 35,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Meu endereço',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cepModel!.logradouro}, ${cepModel!.bairro}, ${cepModel!.localidade}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    cepModel!.cep.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              child: Text(cepModel!.uf.toString()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getInfoByCep();
          cepFocusNode.unfocus();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
