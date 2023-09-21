import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPageIndexNotifier extends StateNotifier<int> {
  SelectedPageIndexNotifier() : super(0);

  int get setPageIndex => state;

  set setPageIndex(int index) {
    state = index;
  }
}

final navigationIndexProvider =
    StateNotifierProvider<SelectedPageIndexNotifier, int>(
        (ref) => SelectedPageIndexNotifier());
