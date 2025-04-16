import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hope7/models/principle_model.dart';

class PrincipleDetailPage extends StatelessWidget {
  final PrincipleModel principle;

  const PrincipleDetailPage({super.key, required this.principle});

  @override
  Widget build(BuildContext context) {
    // Get the first image URL if available.
    final imageUrl =
        principle.imageUrls.isNotEmpty ? principle.imageUrls.first : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(principle.name),
        backgroundColor: Colors.transparent,
      ),
      // Wrap the entire body in a GestureDetector to catch double taps.
      body: GestureDetector(
        onDoubleTap: () => Navigator.pop(context),
        child: SingleChildScrollView(
          child: Padding(
            // Add overall padding so the card doesn't go edge-to-edge.
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // The hero image spans the width; its height is computed using its intrinsic aspect ratio.
                  imageUrl != null
                      ? Hero(
                        tag: 'principleImage_${principle.name}',
                        child: ExtendedImage.asset(
                          imageUrl,
                          fit: BoxFit.fitWidth, // image fills the width
                          width: double.infinity,
                          // No fixed height provided so that height adjusts based on aspect ratio.
                        ),
                      )
                      : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.transparent,
                      ),
                  // The text content inside the card.
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      principle.content,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
