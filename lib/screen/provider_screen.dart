import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/provider.dart';
import 'package:state_management/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingList);

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton(
          itemBuilder: (_) {
            return FilterState.values.map((e) {
              return PopupMenuItem(
                value: e,
                child: Text(e.name),
              );
            }).toList();
          },
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
            switch(value) {
              case FilterState.notSpicy:

                break;
              case FilterState.spicy:
                // TODO: Handle this case.
                break;
              case FilterState.all:
                break;
            }
          },
        ),
      ],
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
