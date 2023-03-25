import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Build');
    final state = ref.watch(selectProvider.select((value) {
      return value.isSpicy;
    }));
    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print(next);
      },
    );

    return DefaultLayout(
      title: 'SelectProvider',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            // Text(state.name),
            // Text(state.isSpicy.toString()),
            // Text(state.hasBought.toString()),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectProvider.notifier).toggleIsSpicy(),
              child: const Text('Spicy Toggle'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(selectProvider.notifier).toggleHasBought(),
              child: const Text('Bought Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
