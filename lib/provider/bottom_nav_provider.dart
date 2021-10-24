import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider = StateNotifierProvider((ref) => BottomNavNotifier());

enum BottomNavEvent { home, search, basket, liked, profile }

class BottomNavNotifier extends StateNotifier<PageModel> {
  BottomNavNotifier() : super(defaultPage);

  static const defaultPage = PageModel(BottomNavEvent.home, 0);

  void selectPage(int i) {
    switch (i) {
      case 0:
        state = PageModel(BottomNavEvent.home, i);
        break;
      case 1:
        state = PageModel(BottomNavEvent.search, i);
        break;
      case 2:
        state = PageModel(BottomNavEvent.basket, i);
        break;
      case 3:
        state = PageModel(BottomNavEvent.liked, i);
        break;
      case 4:
        state = PageModel(BottomNavEvent.profile, i);
        break;
    }
  }
}

class PageModel {
  const PageModel(this.page, this.index);
  final BottomNavEvent page;
  final index;
}
