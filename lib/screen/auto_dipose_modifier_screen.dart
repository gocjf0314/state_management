import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoModifierProvider',
      body: Center(
        child: state.when(
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
      ),
    );
  }
}
