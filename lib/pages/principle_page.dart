// principle_page.dart

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hope7/components/principle_card.dart';
import 'package:hope7/content/principle.dart'; // Assuming this provides the `principles` list

class PrinciplePage extends StatelessWidget {
  const PrinciplePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust crossAxisCount based on the platform.
    final int crossAxisCount;
    if (kIsWeb) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = (Platform.isAndroid || Platform.isIOS) ? 2 : 3;
    }

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
