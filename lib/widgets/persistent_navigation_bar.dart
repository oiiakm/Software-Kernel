import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:software_kernel/pages/cart_page.dart';
import 'package:software_kernel/pages/favorites_page.dart';
import 'package:software_kernel/pages/notification_page.dart';
import 'package:software_kernel/models/count_model.dart';
import 'package:software_kernel/widgets/badge_widget.dart';

class PersistentNavigationBar extends StatefulWidget {
  const PersistentNavigationBar({Key? key}) : super(key: key);

  @override
  _PersistentNavigationBarState createState() =>
      _PersistentNavigationBarState();
}

class _PersistentNavigationBarState extends State<PersistentNavigationBar> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Consumer<CountModel>(
        builder: (context, countModel, _) {
          return PersistentTabView(
            context,
            controller: PersistentTabController(initialIndex: _selectedIndex),
            screens: [
              NotificationPage(
                incrementCount: countModel.incrementNotificationCount,
                decrementCount: countModel.decrementNotificationCount,
                counter: countModel.notificationCount,
              ),
              CartPage(
                incrementCount: countModel.incrementCartCount,
                decrementCount: countModel.decrementCartCount,
                counter: countModel.cartCount,
              ),
              FavoritesPage(
                incrementCount: countModel.incrementFavoritesCount,
                decrementCount: countModel.decrementFavoritesCount,
                counter: countModel.favoritesCount,
              ),
            ],
            items: _buildBottomNavBarItems(countModel),
            navBarHeight: 60,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)
              ],
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style2,
          );
        },
      ),
    );
  }

  List<PersistentBottomNavBarItem> _buildBottomNavBarItems(
      CountModel countModel) {
    List<PersistentBottomNavBarItem> navBarItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: 'Notifications',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        contentPadding: 2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: 'Cart',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        contentPadding: 2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: 'Favorites',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        contentPadding: 2,
      ),
    ];

    return navBarItems
        .asMap()
        .map((index, item) {
          int count = 0;
          switch (index) {
            case 0:
              count = countModel.notificationCount;
              break;
            case 1:
              count = countModel.cartCount;
              break;
            case 2:
              count = countModel.favoritesCount;
              break;
          }
          return MapEntry(
            index,
            PersistentBottomNavBarItem(
              icon: BadgeWidget(
                icon: item.icon,
                count: count,
              ),
              title: item.title,
              activeColorPrimary: item.activeColorPrimary,
              inactiveColorPrimary: item.inactiveColorPrimary,
              contentPadding: item.contentPadding,
            ),
          );
        })
        .values
        .toList();
  }
}
