import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'encomenda_repository.dart';
import 'evento_model.dart';

class EncomendaPage extends StatefulWidget {
  const EncomendaPage({Key? key}) : super(key: key);

  @override
  State<EncomendaPage> createState() => _EncomendaPageState();
}

class _EncomendaPageState extends State<EncomendaPage> {
  final _repository = EncomendaRepository(Dio());
  late Future<List<EventoModel>> events;

  @override
  void initState() {
    events = _repository.getEventsOfPackage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreamento de encomendas'),
      ),
      body: Container(),
    );
  }
}
