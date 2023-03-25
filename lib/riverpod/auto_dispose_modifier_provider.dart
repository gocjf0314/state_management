import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Provider.autoDispose]
///   - Disposing state automatically when you pop current route
///   - Remove cached state data. In other words,
///     Not caching state data and Only using current route.
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5, 6, 7];
});