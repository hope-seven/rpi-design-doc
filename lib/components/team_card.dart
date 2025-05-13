import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/models/team_member.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCardComponent extends StatelessWidget {
  final TeamMember member;

  const TeamCardComponent({super.key, required this.member});

  Future<void> _launchEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: member.email,
      query: 'subject=Hello ${Uri.encodeComponent(member.name)}&body=Hi,',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch email app, please send an email to ${member.email} directly.',
          ),
        ),
      );
    }
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    member.imageAsset,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  member.name,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //     _launchEmail(context);
                //   },
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: const Size.fromHeight(40),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: const Text('Contact Me'),
                // ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: const Text('Close'),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double avatarDiameter;
    if (screenWidth < 400) {
      avatarDiameter = screenWidth * 0.5;
    } else if (screenWidth < 800) {
      avatarDiameter = screenWidth * 0.3;
    } else {
      avatarDiameter = 160.0;
    }
    final borderWidth = avatarDiameter * 0.06;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _showProfileDialog(context),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            padding: EdgeInsets.all(borderWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
              ),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(member.imageAsset),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: avatarDiameter,
          child: Text(
            member.name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
