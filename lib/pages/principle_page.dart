// principle_page.dart

import 'package:flutter/material.dart';
import 'package:hope7/components/principle_card.dart';
import 'package:hope7/content/principle.dart'; // Assuming this provides the `principles` list

class PrinciplePage extends StatelessWidget {
  const PrinciplePage({super.key});

  int _calculateCrossAxisCount(double width) {
    if (width < 600) {
      // phones
      return 1;
    } else {
      // very large screens
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Design Principles"),
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: principles.length,
        itemBuilder: (context, index) {
          return PrincipleCard(principle: principles[index]);
        },
      ),
    );
  }
}
