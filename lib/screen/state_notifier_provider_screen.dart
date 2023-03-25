import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/model/shopping_item_model.dart';
import 'package:state_management/riverpod/state_notifier_provider.dart';


/// Using [StateNotifierProvider] with Widget
/// - T state = widgetRef.watch<NotifierT, T>([StateNotifierProvider]);
/// - NotifierT notifierT = widgetRef.read<T>([StateNotifierProvider.notifier])
///   [T] is [StateNotifierProvider.notifier]. Namely this is [NotifierT]
///   call method: notifierT.method()

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state.map((item) {
          return CheckboxListTile(
            title: Text(item.name),
            value: item.hasBought,
            onChanged: (value) =>
                ref.read(shoppingListProvider.notifier).toggleHasBought(
                      name: item.name,
                    ),
          );
        }).toList(),
      ),
    );
  }
}
