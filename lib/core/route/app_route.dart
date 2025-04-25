import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/account/account_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/notifications/notifications_screen.dart';
import '../../presentation/screens/others/other_screen.dart';
import '../../presentation/tab_screen.dart';
import 'app_route_guard.dart';
part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: TabRoute.page,
            guards: [RouteGuard()],
            path: '/',
            children: [
              AutoRoute(page: HomeTabRoute.page, path: 'home'),
              AutoRoute(
                  page: NotificationsTabRoute.page, path: 'notifications'),
              AutoRoute(page: AccountTabRoute.page, path: 'account'),
              AutoRoute(page: OtherTabRoute.page, path: 'other'),
            ]),

        /// routes go here
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
