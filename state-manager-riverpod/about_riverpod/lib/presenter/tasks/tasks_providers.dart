import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider mais simples
final nameUserProvider = Provider((ref) => 'Ailton D. Vieira');

// Provider com estado
final nameStateProvider = StateProvider((ref) => 'Ailton');