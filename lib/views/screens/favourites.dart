import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/favourite_controller.dart';
import 'package:flutter_state_management/views/widgets/favourite-item.dart';
import 'package:get/get.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});
  static const screenName = '/favourite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favourites'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            GetBuilder<FavouriteController>(
              builder: (controller) {
                return Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: controller.favourites.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return FavouriteItem(
                                product: controller.favourites[index],
                              );
                            },
                            itemCount: controller.favourites.length,
                          )
                        : Center(
                            child: Icon(
                            Icons.emoji_transportation,
                            size: 180,
                          )),
                  ),
                );
              },
              id: Strings.favouritesGetBuilderId,
            )
          ],
        ),
      ),
    );
  }
}
