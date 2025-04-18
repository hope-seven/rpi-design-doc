import 'package:flutter/material.dart';
import 'package:hope7/components/team_card.dart';
import 'package:hope7/models/team_member.dart';

class TeamHeaderComponent extends StatelessWidget {
  const TeamHeaderComponent({
    super.key,
    required this.members,
  });

  final List<TeamMember> members;

  int _calculateColumnCount(double width) {
    // if (width < 600) {
    //   // phones
    //   return 1;
    if (width < 900) {
      // small tablets / narrow windows
      return 2;
    } else {
      // large screens
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final columns = _calculateColumnCount(totalWidth);

            // spacing & padding
            const spacing = 16.0;
            const horizontalPadding = 16.0;
            final usableWidth = totalWidth - horizontalPadding * 2 - spacing * (columns - 1);
            final cardWidth = usableWidth / columns;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: spacing,
                runSpacing: spacing,
                children: members.map((member) {
                  return SizedBox(
                    width: cardWidth,
                    child: TeamCardComponent(member: member),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
