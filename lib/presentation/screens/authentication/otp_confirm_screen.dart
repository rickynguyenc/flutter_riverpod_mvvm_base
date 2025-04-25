import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class OtpconfirmScreen extends HookConsumerWidget {
  const OtpconfirmScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Image.asset('assets/images/login_banner.png'),
        ),
      ],
    ));
  }
}
