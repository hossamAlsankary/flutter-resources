// Page View Examples
import 'package:desktop/delivertscreen/delivery.dart';
import 'package:desktop/notificationscreen/notification.dart';
import 'package:desktop/resturantscreen/resturant.dart';
import 'package:desktop/setingscreen/setings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color tabitemcolor = Colors.white;
  int _currentIndex = 0;
  PageController _pageController = PageController();

  onTabTapped(val) {
    setState(() {
      if (defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.windows) {
        setState(() {});
      }
      _currentIndex = val;
      _pageController.jumpToPage(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          MyResturantScreen(),
          Deliveryapp(),
          NotificationScreen(),
          SetingScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,

        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
              ),
              label: "Restaurant"),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
            ),
            label: 'Delivery',
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_important_outlined,
            ),
            label: 'Notification',
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Seting',
          ),
        ],
      ),
    );
  }
}
