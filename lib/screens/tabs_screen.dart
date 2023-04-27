import 'package:flutter/material.dart';
import '../tabs/closet_tab.dart';
import '../tabs/generate_tab.dart';
import '../tabs/outfits_tab.dart';
import '../tabs/profile_tab.dart';

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected; // new

  const SquareIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = 63.0;
    var ratio = 1;
    return SizedBox(
      width: size * ratio,
      height: size * ratio,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(27.0)),
          ),
          elevation: 6,
          backgroundColor: Colors.white,
          shadowColor: Colors.black
              .withOpacity(1), // Set the opacity of the shadow color
        ),
        child: Icon(
          icon,
          size: 32,
          color: isSelected ? Color(0xFFF2A444) : Color(0xFF63BFAE), // modified
        ),
      ),
    );
  }
}

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    ClosetTab(),
    GenerateTab(),
    OutfitsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //This is where the different tabs will show
          Expanded(
            child: Center(
              child: _tabs[_selectedIndex],
            ),
          ),
          Container(
            height: 130,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF63BFAE),
                    Color.fromRGBO(99, 191, 174, 0),
                  ],
                ),
              ),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SquareIconButton(
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 0;
                              });
                            },
                            icon: Icons.door_back_door,
                            isSelected: _selectedIndex == 0, // modified
                          ),
                          SquareIconButton(
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            },
                            icon: Icons.auto_awesome,
                            isSelected: _selectedIndex == 1, // modified
                          ),
                          SquareIconButton(
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 2;
                              });
                            },
                            icon: Icons.group_work,
                            isSelected: _selectedIndex == 2, // modified
                          ),
                          SquareIconButton(
                            onPressed: () {
                              setState(() {
                                _selectedIndex = 3;
                              });
                            },
                            icon: Icons.person,
                            isSelected: _selectedIndex == 3, // modified
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
