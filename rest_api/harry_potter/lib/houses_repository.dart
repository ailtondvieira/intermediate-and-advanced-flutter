import 'package:dio/dio.dart';
import 'package:harry_potter/house_model.dart';

class HousesRepository {
  final Dio dio;
  HousesRepository(this.dio);

  Future<List<HouseModel>> getAllHouses() async {
    List<HouseModel> houses = [];

    final response = await dio.get(
      'https://wizard-world-api.herokuapp.com/Houses',
    );

    houses = List<HouseModel>.from(
      response.data.map((house) {
        return HouseModel.fromMap(house);
      }),
    );

    return houses;
  }
}
