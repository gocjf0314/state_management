import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

/// CodeGeneration이 해결한 문제
/// 1) 어떤 프로바이더를 사용 할지 고민 할 필요가 없도록 해줌
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

/// 소문자로 riverpod 데코레이터를 선언하면 자동으로 AutoDisposeProvider로 생성된다
@riverpod
String gStateProvider(GStateProviderRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

/// 원하는 Provider로 생성하고 싶은 경우 @Riverpod()으로 선언
/// keepAlive 인자로 false true 설정(상태 값을 살아 있는 상태로 유지 할 것이냐 아니냐)
/// default 값은 false. true 로 설정 시 AutoDispose로 생성 되지 않음
///
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}


/// 2) Parameter > Family: Parameter를 일반 함수처럼 사용할 수 있도록 해줌
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>((ref, parameter) {
  return parameter.number1 * parameter.number2;
});

@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {

  // Set initial state
  @override
  int build() {
    return 100;
  }

  increment() {
    ++state;
  }

  decrement() {
    --state;
  }
}