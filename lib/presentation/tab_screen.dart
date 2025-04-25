import 'package:auto_route/auto_route.dart';
import 'package:dhy_flutter_app/core/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TabScreen extends HookConsumerWidget {
  const TabScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      return null;
    }, []);
    return AutoTabsScaffold(
      routes: const [
        HomeTabRoute(),
        NotificationsTabRoute(),
        AccountTabRoute(),
        OtherTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xffEC1C23),
          unselectedItemColor: Color(0xff616161),
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xffEC1C23),
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xff616161),
          ),
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: ColorFilter.mode(
                      tabsRouter.activeIndex == 0
                          ? Color(0xffEC1C23)
                          : const Color(0xff616161),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        colorFilter: ColorFilter.mode(
                          tabsRouter.activeIndex == 2
                              ? Color(0xffEC1C23)
                              : const Color(0xff616161),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 8,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Color(0xffEC1C23),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '66',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Thông báo'),
            BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/icons/account.svg',
                    colorFilter: ColorFilter.mode(
                      tabsRouter.activeIndex == 3
                          ? Color(0xffEC1C23)
                          : const Color(0xff616161),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Tài khoản'),
            BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/icons/other.svg',
                    colorFilter: ColorFilter.mode(
                      tabsRouter.activeIndex == 4
                          ? Color(0xffEC1C23)
                          : const Color(0xff616161),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: 'Khác'),
          ],
        );
      },
    );
  }
}
