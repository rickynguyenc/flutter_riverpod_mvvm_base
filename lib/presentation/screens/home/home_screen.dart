import 'package:auto_route/auto_route.dart';
import 'package:dhy_flutter_app/data/datasources/remote/home_remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeTabScreen extends HookConsumerWidget {
  const HomeTabScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(homeServiceProvider).getCharacters({
          'page': 1,
        });
        return null;
      },
      const [],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Tab'),
      ),
    );
  }
}
