import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/shopping_item_model.dart';

/// StateNotifierProvider<NotifierT extends StateNotifier<T>, T>
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

/// [StateNotifier]<[T]>
/// [state] is [T]
/// In other words, [state] is data that I want to manage
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier() : super([
    ShoppingItemModel(
      name: '김치',
      quantity: 3,
      hasBought: false,
      isSpicy: true,
    ),
    ShoppingItemModel(
      name: '라면',
      quantity: 5,
      hasBought: false,
      isSpicy: true,
    ),
    ShoppingItemModel(
      name: '삼겹살',
      quantity: 10,
      hasBought: false,
      isSpicy: false,
    ),
    ShoppingItemModel(
      name: '수박',
      quantity: 2,
      hasBought: false,
      isSpicy: false,
    ),
    ShoppingItemModel(
      name: '감자칩',
      quantity: 4,
      hasBought: false,
      isSpicy: true,
    ),
  ]);

  void toggleHasBought({required String name}) {
    state = state.map((item) {
      return item.name == name ? ShoppingItemModel(
        name: item.name,
        quantity: item.quantity,
        hasBought: !item.hasBought,
        isSpicy: item.isSpicy,
      ) : item;
    }).toList();
  }
}