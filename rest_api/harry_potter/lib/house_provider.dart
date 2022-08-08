import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'house_model.dart';
import 'house_notifier.dart';

final houseProvider = StateNotifierProvider<HouseNotifier, List<HouseModel>>(
  (ref) => HouseNotifier(),
);