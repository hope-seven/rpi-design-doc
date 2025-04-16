// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope7/pages/our_team_page.dart';
import 'package:hope7/pages/principle_page.dart';
import 'package:hope7/pages/prototype_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope 7 Design Document',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // Text color for AppBar
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.blueAccent,
          labelStyle: TextStyle(
            fontSize: 16, // tab text size
            fontWeight: FontWeight.bold, // tab text weight
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return Colors.blue.withValues(alpha: 0.2);
            }
            return Colors.transparent; // default
          }),
          unselectedLabelColor: Colors.grey,
          // unselected tab text color
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.blueAccent, // underline color
              width: 3.0, // underline thickness
            ),
          ),
        ),
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
  int _selectedIndex = 1; // Default to PrototypePage

  final List<Widget> _pages = [OurTeamPage(), PrototypePage(initialSection: 'Homepage'), PrinciplePage()];

  final List<String> _tabs = ['Our Team', 'Prototype', 'Principles'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hope 7',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs:
                _tabs
                    .map(
                      (label) =>
                          Tab(child: Text(label, style: GoogleFonts.poppins())),
                    )
                    .toList(),
          ),
        ),
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (
            Widget child,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: Colors.blue.withValues(
                alpha:
                    0.15, // Ensures the background is transparent during transition
              ),
              child: child,
            );
          },
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }
}
