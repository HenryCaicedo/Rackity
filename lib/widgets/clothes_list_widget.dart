import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'image_card_widget.dart';
import '../lists/clothes_list.dart';
import '../screens/garment_screen.dart';

class ClothesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: clothes.length,
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(1, index.isEven ? 1.3 : 1),
            mainAxisSpacing: 6,
            crossAxisSpacing: 16,
            itemBuilder: (BuildContext context, int index) {
              Garment garment = clothes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GarmentScreen(garment: garment),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromRGBO(39, 88, 76, 0.85).withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          image: garment.image,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
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
