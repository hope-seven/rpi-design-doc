import 'package:flutter/material.dart';
import 'package:hope7/components/team_header.dart';
import 'package:hope7/content/team.dart'; // Make sure to import your team members data

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamHeaderComponent(
              members: teamMembers,
            ),
          ],
        ),
      ),
    );
  }
}
