// principle_card.dart

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hope7/components/principle_detail_card.dart';
import 'package:hope7/models/principle_model.dart';

class PrincipleCard extends StatelessWidget {
  final PrincipleModel principle;

  const PrincipleCard({super.key, required this.principle});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        principle.imageUrls.isNotEmpty ? principle.imageUrls.first : null;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PrincipleDetailPage(principle: principle),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display image with Hero animation.
            Expanded(
              flex: 6,
              child:
                  imageUrl != null
                      ? Hero(
                        tag: 'principleImage_${principle.name}',
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: ExtendedImage.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      )
                      : Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          color: Colors.grey.shade300,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lightbulb_outline,
                            size: 48,
                            color: Colors.blue,
                          ),
                        ),
                      ),
            ),
            // Display the principle name.
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(
                  principle.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
