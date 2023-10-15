import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:nikestore/views/HomeView/widgets/HomeTab.dart';



class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainView createState() => _MainView();
}

class _MainView extends State<MainView> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
   const HomeTab(),
    const Center(child: Text("2")),
    const Center(child: Text("3")),
    const Center(child: Text("4")),

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(

          height:55,

          animationCurve: Curves.bounceIn,
          selectedIndex: _selectedIndex,
          iconSize: 25,
          showElevation: false,
          animationDuration: const Duration(milliseconds: 0),
          // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;

          }),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.black,
              icon:const Icon(Icons.home_outlined,),
              title: const Icon(Icons.home_outlined,color: Colors.red,),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.black,
              icon: const Icon(Icons.bookmark_border_rounded,),
              title:const Icon(Icons.bookmark_border_rounded,color: Colors.red,),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.black,
              icon: const Icon(Icons.shopping_bag_outlined),
              title: const Icon(Icons.shopping_bag_outlined,color: Colors.red,),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red,
              inactiveColor: Colors.black,
              icon: const Icon(Icons.account_circle),
              title: const Icon(Icons.account_circle,color: Colors.red,),
            ),
          ],
        ),
      );

  }
}