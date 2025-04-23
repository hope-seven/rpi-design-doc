import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hope7/models/principle_model.dart';

class PrincipleDetailPage extends StatelessWidget {
  final PrincipleModel principle;

  const PrincipleDetailPage({super.key, required this.principle});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        principle.imageUrls.isNotEmpty ? principle.imageUrls.first : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(principle.name),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onDoubleTap: () => Navigator.pop(context),
        child: SingleChildScrollView(
          child: Padding(
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
                  imageUrl != null
                      ? Hero(
                        tag: 'principleImage_${principle.name}',
                        child: ExtendedImage.asset(
                          imageUrl,
                          // fit: BoxFit.fitWidth, // image fills the width
                          fit: BoxFit.cover,
                          // width: double.infinity,
                        ),
                      )
                      : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.transparent,
                      ),
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
