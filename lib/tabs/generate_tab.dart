import 'package:flutter/material.dart';

class GenerateTab extends StatefulWidget {
  @override
  _GenerateTabState createState() => _GenerateTabState();
}

class _GenerateTabState extends State<GenerateTab> {
  @override
  Widget build(BuildContext context) {
    double side = 130;
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
        automaticallyImplyLeading: false, // This line removes the back button
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Manual'),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(130, 40)),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Auto'),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(130, 40)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: side,
                      height: side,
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: side,
                      height: side,
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: side,
                      height: side,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.swap_horiz),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
