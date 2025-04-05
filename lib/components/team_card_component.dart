import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/models/team_member.dart';

class TeamCardComponent extends StatelessWidget {
  final TeamMember member;

  const TeamCardComponent({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
            ),
          ),
          child: CircleAvatar(
            radius: 125,
            backgroundImage: AssetImage(member.imageAsset),
            backgroundColor: Colors.grey[200],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          member.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
