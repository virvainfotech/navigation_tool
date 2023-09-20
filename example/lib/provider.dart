import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoolStateNotifier extends StateNotifier<bool> {
  BoolStateNotifier() : super(false);

  bool get isExpanded => state;

  set toggle(bool expanded) {
    state = expanded;
  }
}

final isExpandedNavRail =
StateNotifierProvider<BoolStateNotifier, bool>((ref) {
  return BoolStateNotifier();
});