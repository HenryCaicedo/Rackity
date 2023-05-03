import 'package:flutter/material.dart';
import '../colors.dart';

class GenerateTab extends StatefulWidget {
  @override
  _GenerateTabState createState() => _GenerateTabState();
}

class _GenerateTabState extends State<GenerateTab> {
  @override
  Widget build(BuildContext context) {
    var side = 128.0;
    var radius = 14.0;
    return Scaffold(
      backgroundColor: Color(0xFFBCDED6),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.0, 68.0, 16.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Code to be executed when the 'Auto' button is pressed
                  },
                  child: Text(
                    'Auto',
                    style: TextStyle(
                      color: Color(0xFF27584C), // Set the text color to #27584C
                      fontSize: 18, // Set the font size to 20
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(105, 42)),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFFAAD2C9),
                    ), // Use #AAD2C9 color
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // Make the radius smaller
                    )),
                  ),
                ),
                SizedBox(width: 16), // Add some space between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Code to be executed when the 'Manual' button is pressed
                  },
                  child: Text(
                    'Manual',
                    style: TextStyle(
                      color: Color(0xFF27584C), // Set the text color to #27584C
                      fontSize: 18, // Set the font size to 20
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(105, 42)),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFFAAD2C9),
                    ), // Use #AAD2C9 color
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // Make the radius smaller
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: side,
                  height: side,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.08),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ]),
                ),
                SizedBox(height: 14),
                Container(
                  width: side,
                  height: side * 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.08),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ]),
                ),
                SizedBox(height: 14),
                Container(
                  width: side,
                  height: side,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.08),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ]),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE7A757),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE7A757),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.swap_horiz,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )

          // Add the rest of your content here...
        ],
      ),
    );
  }
}
