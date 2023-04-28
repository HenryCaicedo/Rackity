import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'image_card_widget.dart';

class ClothesListWidget extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: items.length,
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(1, index.isEven ? 1.3 : 1),
            mainAxisSpacing: 6,
            crossAxisSpacing: 16,
            itemBuilder: (BuildContext context, int index) {
              //The shadows of these containers are clipped
              return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(39, 88, 76, 0.85).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
