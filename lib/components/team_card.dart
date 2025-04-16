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
  bool _isHovering = false;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Set up controller for the scale animation; use a lower bound less than 1 for a nice effect.
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

  // Helper function to launch email app.
  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.member.email,
      query:
          'subject=Hello ${Uri.encodeComponent(widget.member.name)}&body=Hi,',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch email app')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
        _controller.forward();
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
        _controller.reverse();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stack to overlay email icon on top of the avatar.
          Stack(
            alignment: Alignment.center,
            children: [
              // Circular avatar with gradient border.
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                  ),
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(widget.member.imageAsset),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              // Email icon overlay: covers the whole avatar area.
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _isHovering ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: GestureDetector(
                          onTap: _launchEmail,
                          child: const Icon(
                            Icons.mail_outline,
                            size: 80,
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
          const SizedBox(height: 8),
          // Name below the avatar.
          Text(
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
        ],
      ),
    );
  }
}
