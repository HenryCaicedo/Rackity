import 'package:flutter/material.dart';
import '../tabs/search_tab.dart';
import '../tabs/closet_tab.dart';
import '../tabs/generate_tab.dart';
import '../tabs/outfits_tab.dart';
import '../tabs/profile_tab.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  double _iconSize = 30.0;
  bool showNames = true; // add the boolean variable

  static List<Widget> _widgetOptions = <Widget>[
    ClosetTab(),
    GenerateTab(),
    OutfitsTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 90.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door, size: _iconSize),
              label: showNames ? 'Closet' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome, size: _iconSize),
              label: showNames ? 'Generate' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, size: _iconSize),
              label: showNames ? 'Outfits' : '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: _iconSize),
              label: showNames ? 'My profile' : '',
            ),
          ],
        ),
      ),
    );
  }
}
