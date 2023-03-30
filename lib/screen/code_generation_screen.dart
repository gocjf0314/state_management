import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Build');
    final state = ref.watch(gStateProviderProvider);
    final futureState = ref.watch(gStateFutureProvider);
    final futureAliveState = ref.watch(gStateFuture2Provider);
    final familyState = ref.watch(gStateMultiplyProvider(
      number1: 12,
      number2: 14,
    ));

    return DefaultLayout(
      title: 'CodeGeneration',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('state: $state'),
          const SizedBox(height: 10),
          futureState.when(
            data: (data) => Text('future state: $data'),
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 10),
          futureAliveState.when(
            data: (data) => Text('future alive state: $data'),
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 10),
          Text('family state: $familyState'),
          const SizedBox(height: 10),
          // 리스닝 기능은 살리면서 부분적인 렌더링으로 효율적인 리소스 사용
          // child parameter에 들어간 위젯은 리스닝 대상에 포함 되지 않는다.
          // 즉, 값에 따라 바뀌는 부분만 국소적으로 build 시켜주고 나머지는 child에 넣어준다.
          Consumer(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: ref.read(gStateNotifierProvider.notifier).increment,
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: ref.read(gStateNotifierProvider.notifier).decrement,
                  child: Text('Decrement'),
                ),
                // invalidate(): 유효하지 않게 하다.
                // 즉, 상태를 초기화 한다.
                ElevatedButton(
                  onPressed: () => ref.invalidate(gStateNotifierProvider),
                  child: Text('Invalidate'),
                ),
              ],
            ),
            builder: (context, ref, child) {
              final stateNotifier = ref.watch(gStateNotifierProvider);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('state notifier: $stateNotifier'),
                  child ?? Container(),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}