import 'package:dio/dio.dart';

import 'evento_model.dart';

class EncomendaRepository {
  final Dio dio;
  EncomendaRepository(this.dio);

  Future<List<EventoModel>> getEventsOfPackage() async {
    List<EventoModel> events = [];

    var data = {
      'code': 'ON931559908BR',
      'type': 'LS',
    };

    final response = await dio.post(
      'https://correios.contrateumdev.com.br/api/rastreio',
      data: data,
    );

    events = List.from(
      response.data['objeto'][0]['evento'].map((evento) {
        return EventoModel.fromMap(evento);
      }),
    );

    return events;
  }
}
