import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for(int value = 1; value < 11; ++value) {
    await Future.delayed(Duration(seconds: 1));
    yield List.generate(3, (index) => index * value);
  }
});