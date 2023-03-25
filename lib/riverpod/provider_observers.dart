import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver{
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('[Provider Updated] provider:$provider / pre:$previousValue / next:$newValue');
    // TODO: implement didUpdateProvider
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('[Provider Added] provider:$provider / value:$value');
    // TODO: implement didAddProvider
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('[Provider Disposed] provider:$provider');
    // TODO: implement didDisposeProvider
    super.didDisposeProvider(provider, container);
  }
}