import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:hope7/components/team_card.dart';
import 'package:hope7/models/team_member.dart';

class TeamHeaderComponent extends StatelessWidget {
  const TeamHeaderComponent({
    super.key,
    required this.members,
  });

  final List<TeamMember> members;

  // This function checks the platform and returns the desired number of columns.
  Future<int> _getColumnCount() async {
    if (Platform.isAndroid || Platform.isIOS) {
      return 1; // Mobile devices: 1 column
    } else {
      return 3; // Desktop devices: 3 columns
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _getColumnCount(),
      builder: (context, snapshot) {
        // Default to 3 columns if snapshot not ready.
        int desiredColumns = snapshot.hasData ? snapshot.data! : 3;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                // Calculate spacing, side padding, and card width based on desired columns.
                final spacing = 16.0;
                final sidePadding = 16.0 * 2;
                final cardWidth = (constraints.maxWidth - sidePadding - spacing * (desiredColumns - 1)) / desiredColumns;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: spacing,
                    runSpacing: spacing,
                    children: members
                        .map(
                          (member) => SizedBox(
                            width: cardWidth,
                            child: TeamCardComponent(member: member),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
