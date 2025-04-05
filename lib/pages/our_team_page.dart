import 'package:flutter/material.dart';
import 'package:hope7/components/team_header_component.dart';
import 'package:hope7/content/team_data.dart'; // Make sure to import your team members data

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradStudents =
        teamMembers.where((member) => member.role == "grad").toList();
    final undergradStudents =
        teamMembers.where((member) => member.role == "undergrad").toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamHeaderComponent(
              title: "Graduate Students",
              members: gradStudents,
            ),
            const SizedBox(height: 30),
            TeamHeaderComponent(
              title: "Undergraduate Students",
              members: undergradStudents,
            ),
          ],
        ),
      ),
    );
  }
}
