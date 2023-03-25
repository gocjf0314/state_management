import 'package:flutter/material.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/screen/auto_dipose_modifier_screen.dart';
import 'package:state_management/screen/family_modifier_screen.dart';
import 'package:state_management/screen/future_provider_screen.dart';
import 'package:state_management/screen/listen_provider_screen.dart';
import 'package:state_management/screen/provider_screen.dart';
import 'package:state_management/screen/select_provider_screen.dart';
import 'package:state_management/screen/state_notifier_provider_screen.dart';
import 'package:state_management/screen/state_provider_screen.dart';
import 'package:state_management/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  pushProviderScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              StateProviderScreen(),
            ),
            child: Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              StateNotifierProviderScreen(),
            ),
            child: Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              FutureProviderScreen(),
            ),
            child: Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              StreamProviderScreen(),
            ),
            child: Text('StreamProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              FamilyModifierScreen(),
            ),
            child: Text('FamilyModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              AutoDisposeModifierScreen(),
            ),
            child: Text('AutoDisposeModifierScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              ListenProviderScreen(),
            ),
            child: Text('ListenProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              SelectProviderScreen(),
            ),
            child: Text('SelectProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () => pushProviderScreen(
              context,
              ProviderScreen(),
            ),
            child: Text('ProviderScreen'),
          ),
        ],
      ),
    );
  }
}
