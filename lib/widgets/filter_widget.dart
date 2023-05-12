import 'package:flutter/material.dart';
import '../colors.dart';
import '../screens/filtered_clothes_list.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _selectedGarmentType = 'Top';

  List<String> _garmentTypes = [
    'Top',
    'Bottom',
    'Footwear',
  ];

  List<String> _garmentTags = [
    "Dresses",
    "Outerwear",
    "Activewear",
    "Casual",
    "Formal",
    "Accessories",
    "Swimwear"
  ];

  List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.847).withOpacity(0.08),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _garmentTypes
                          .map(
                            (type) => Row(
                              children: [
                                Radio(
                                  value: type,
                                  groupValue: _selectedGarmentType,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGarmentType = value!;
                                    });
                                  },
                                ),
                                Text(type),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    Wrap(
                      spacing: 2,
                      runSpacing: 0,
                      children: _garmentTags
                          .map(
                            (tag) => ChoiceChip(
                              label: Text(tag),
                              selected: _selectedTags.contains(tag),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedTags.add(tag);
                                  } else {
                                    _selectedTags.remove(tag);
                                  }
                                });
                              },
                              selectedColor: Color.fromARGB(172, 228, 171, 101),
                              backgroundColor: Colors.grey[300],
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                        height: 16.0), // Add spacing between chips and buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Close the widget
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilteredClothesList(),
                              ),
                            );
                          },
                          child: Text('Apply'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
