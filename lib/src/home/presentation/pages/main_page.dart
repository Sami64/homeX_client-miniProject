import 'package:flutter/material.dart';
import 'package:home_x_client/src/explore/presentation/pages/explore_page.dart';
import 'package:home_x_client/src/home/presentation/pages/home_page.dart';
import 'package:home_x_client/src/orders/presentation/pages/orders_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 1;
  List<Widget> _pages = [ExplorePage(), HomePage(), OrdersPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) => setState(() => pageIndex = value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: 'Your Orders')
        ],
      ),
    );
  }
}
