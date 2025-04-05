// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/pages/methodology_page.dart';
import 'package:hope7/pages/our_team_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Navigation Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.deepPurple,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
          },
        ),
      ),
      home: TopNavPage(),
    );
  }
}

class TopNavPage extends StatefulWidget {
  const TopNavPage({super.key});

  @override
  _TopNavPageState createState() => _TopNavPageState();
}

class _TopNavPageState extends State<TopNavPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    OurTeamPage(),
    MethodologyPage(),
    // PrinciplesPage()
  ];

  final List<String> _tabs = ['Our Team', 'Prototype', 'Principles'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Navigation',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        bottom: TabBar(
          controller: TabController(
            length: _tabs.length,
            vsync: this,
            initialIndex: _selectedIndex,
          ),
          tabs:
              _tabs
                  .map(
                    (label) =>
                        Tab(child: Text(label, style: GoogleFonts.poppins())),
                  )
                  .toList(),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        reverse: false,
        transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pages[_selectedIndex],
      ),
    );
  }
}
