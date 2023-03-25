import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleFutureProvider = FutureProvider<List<int>>((ref) async {
  debugPrint('current: ${DateTime.now().toString()}');
  await Future.delayed(Duration(seconds: 3));
  debugPrint('delayed: ${DateTime.now().toString()}');
  // throw Exception('Can Not getting data');
  return [1, 2, 3, 4, 5, 6, 7];
});