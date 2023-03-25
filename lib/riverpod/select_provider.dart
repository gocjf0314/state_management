import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) {
  return SelectNotifier();
});

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
          name: '라면',
          quantity: 0,
          hasBought: false,
          isSpicy: true,
        ));

  void toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  void toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}