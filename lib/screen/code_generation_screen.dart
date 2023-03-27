import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List state = [
      ref.watch(gStateProviderProvider),
    ];
    return DefaultLayout(
      title: 'CodeGeneration',
      body: Column(
        children: state.map((e) => Text(e.toString())).toList(),
      ),
    );
  }
}
