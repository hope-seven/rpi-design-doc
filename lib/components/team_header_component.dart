import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/components/team_card_component.dart';
import 'package:hope7/models/team_member.dart';


class TeamHeaderComponent extends StatelessWidget {
  const TeamHeaderComponent({
    super.key,
    required this.title,
    required this.members,
  });

  final String title;
  final List<TeamMember> members;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children:
              members
                  .map((member) => TeamCardComponent(member: member))
                  .toList(),
        ),
      ],
    );
  }
}
