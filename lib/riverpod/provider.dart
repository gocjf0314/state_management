import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/shopping_item_model.dart';
import 'package:state_management/riverpod/state_notifier_provider.dart';

final filteredShoppingList = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);

  switch(filterState) {
    case FilterState.notSpicy:
      return shoppingListState.where((element) {
        return element.isSpicy == false;
      }).toList();
    case FilterState.spicy:
      return shoppingListState.where((element) {
        return element.isSpicy == true;
      }).toList();
    case FilterState.all:
     return shoppingListState;
  }

  return [];
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);