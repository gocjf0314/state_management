import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with SingleTickerProviderStateMixin{
  late final TabController tabController;
  final int tabCount = 10;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: tabCount,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(listenProvider, (previous, next) {
      print(previous);
      print(next);
      if(previous != next) {
        tabController.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProvider',
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          tabCount,
          (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  index.toString(),
                  textScaleFactor: 1.3,
                ),
                Visibility(
                  visible: index < tabCount - 1,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(listenProvider.notifier).update((state) {
                        return state == tabCount ? tabCount : (state + 1);
                      });
                    },
                    child: Text('다음'),
                  ),
                ),
                Visibility(
                  visible: index > 0,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(listenProvider.notifier).update((state) {
                        return state == 0 ? 0 : (state - 1);
                      });
                    },
                    child: Text('이전'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
