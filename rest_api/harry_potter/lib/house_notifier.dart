import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'house_model.dart';
import 'houses_repository.dart';

class HouseNotifier extends StateNotifier<List<HouseModel>> {
  final _repository = HousesRepository(Dio());

  HouseNotifier() : super([]) {
    getAllHouses();
  }

  getAllHouses() async {
    state = await _repository.getAllHouses();
  }
}
