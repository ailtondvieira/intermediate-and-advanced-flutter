import 'dart:convert';

class HouseModel {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String? animal;
  final String? element;
  final String ghost;
  final String commonRoom;
  final List<HeadModel> heads;
  final List<TraitModel> traits;

  HouseModel({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    this.animal,
    this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'houseColours': houseColours});
    result.addAll({'founder': founder});
    if (animal != null) {
      result.addAll({'animal': animal});
    }
    if (element != null) {
      result.addAll({'element': element});
    }
    result.addAll({'ghost': ghost});
    result.addAll({'commonRoom': commonRoom});
    result.addAll({'heads': heads.map((x) => x.toMap()).toList()});
    result.addAll({'traits': traits.map((x) => x.toMap()).toList()});

    return result;
  }

  factory HouseModel.fromMap(Map<String, dynamic> map) {
    return HouseModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      houseColours: map['houseColours'] ?? '',
      founder: map['founder'] ?? '',
      animal: map['animal'],
      element: map['element'],
      ghost: map['ghost'] ?? '',
      commonRoom: map['commonRoom'] ?? '',
      heads: List<HeadModel>.from(
        map['heads']?.map((head) => HeadModel.fromMap(head)),
      ),
      traits: List<TraitModel>.from(
        map['traits']?.map((trait) => TraitModel.fromMap(trait)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HouseModel.fromJson(String source) =>
      HouseModel.fromMap(json.decode(source));
}

class HeadModel {
  final String id;
  final String firstName;
  final String lastName;

  HeadModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});

    return result;
  }

  factory HeadModel.fromMap(Map<String, dynamic> map) {
    return HeadModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HeadModel.fromJson(String source) =>
      HeadModel.fromMap(json.decode(source));
}

class TraitModel {
  final String id;
  final String name;

  TraitModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    return result;
  }

  factory TraitModel.fromMap(Map<String, dynamic> map) {
    return TraitModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TraitModel.fromJson(String source) =>
      TraitModel.fromMap(json.decode(source));
}
