import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/models/team_member.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCardComponent extends StatefulWidget {
  final TeamMember member;

  const TeamCardComponent({super.key, required this.member});

  @override
  State<TeamCardComponent> createState() => _TeamCardComponentState();
}

class _TeamCardComponentState extends State<TeamCardComponent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _scaleAnimation = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: widget.member.email,
      query:
          'subject=Hello ${Uri.encodeComponent(widget.member.name)}&body=Hi,',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch email app')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine avatar diameter: 40% of width on mobile, else 160px
    double avatarDiameter;
    if (screenWidth < 400) {
      avatarDiameter = screenWidth * 0.5;
    } else if (screenWidth < 800) {
      avatarDiameter = screenWidth * 0.3;
    } else {
      avatarDiameter = 160.0;
    }
    final borderWidth = avatarDiameter * 0.06;
    final emailIconSize = avatarDiameter * 0.35;

    // Treat small width as phone
    final bool isPhone = screenWidth < 600;

    // Phone: static avatar + name, tap avatar to email
    if (isPhone) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _launchEmail,
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
                backgroundImage: AssetImage(widget.member.imageAsset),
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: avatarDiameter,
            child: Text(
              widget.member.name,
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

    // Desktop/Web: hover + animation
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _controller.reverse();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: avatarDiameter,
            height: avatarDiameter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient border + avatar
                Container(
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
                    backgroundImage: AssetImage(widget.member.imageAsset),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                // Email overlay on hover
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _isHovering ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: GestureDetector(
                            onTap: _launchEmail,
                            child: Icon(
                              Icons.mail_outline,
                              size: emailIconSize,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: avatarDiameter,
            child: Text(
              widget.member.name,
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
      ),
    );
  }
}
