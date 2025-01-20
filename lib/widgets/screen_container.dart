import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../destinations.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer(
      {super.key,
      required this.child,
      required this.destinationIndex,
      this.title = ""});

  final Widget child;
  final int destinationIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWideScreen = width > 900;

    return Scaffold(
      floatingActionButton: isWideScreen
          ? null
          : FloatingActionButton(
              onPressed: () => Get.toNamed("/add-recipe"),
              child: const Icon(Icons.add),
            ),
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              leading: FloatingActionButton(
                onPressed: () => Get.toNamed("/add-recipe"),
                child: const Icon(Icons.add),
              ),
              backgroundColor: Colors.white,
              destinations: destinations
                  .map<NavigationRailDestination>(
                      (d) => NavigationRailDestination(
                            icon: Icon(d.icon),
                            label: Text(d.label),
                          ))
                  .toList(),
              selectedIndex: destinationIndex,
              onDestinationSelected: (index) =>
                  Get.toNamed(destinations[index].route),
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1536),
                child: child,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : NavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              destinations: destinations
                  .map<NavigationDestination>((d) => NavigationDestination(
                        icon: Icon(d.icon),
                        label: d.label,
                      ))
                  .toList(),
              selectedIndex: destinationIndex,
              onDestinationSelected: (index) =>
                  Get.toNamed(destinations[index].route),
            ),
    );
  }
}
