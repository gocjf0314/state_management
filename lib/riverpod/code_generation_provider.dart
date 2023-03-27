import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// CodeGeneration이 해결한 문제
// 1) 어떤 프로바이더를 사용 할지 고민 할 필요가 없도록 해줌
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

// 2) Parameter > Family: Parameter를 일반 함수처럼 사용할 수 있도록 해줌
@riverpod
String gStateProvider(GStateProviderRef ref) {
  return 'Hello Code Generation';
}