import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Provider.family]
///   - when you want to show or handle multiple values
///   - when you want to change logic in provider according to argument
///   - [ref] : To be returned
///   - [data] : To be used according to argument value
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async{
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
