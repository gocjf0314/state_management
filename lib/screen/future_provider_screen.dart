import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> state = ref.watch(multipleFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state.when(
            data: (data) => Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: data.map((value) => Text(
                          value.toString(),
                          textScaleFactor: 1.3,
                        )).toList(),
              ),
            ),
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
