import 'package:flutter/material.dart';
import 'package:karyasmk/models/MenuModel.dart';
import 'package:karyasmk/widgets/MenuItem.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuModel("Software", "assets/images/wireframe.png"),
      MenuModel("Electronic", "assets/images/circuit.png"),
      MenuModel("Handycraft", "assets/images/crayon.png"),
      MenuModel("Multimedia", "assets/images/multimedia.png"),
      MenuModel("Food", "assets/images/food.png"),
      MenuModel("Others", "assets/images/box.png"),
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 25.0,
        crossAxisSpacing: 15.0,
      ),
      padding: EdgeInsets.all(19.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (BuildContext context, int index) {
        return MenuItem(
          title: menuItems[index].title,
          imagePath: menuItems[index].image,
        );
      },
    );
  }
}
