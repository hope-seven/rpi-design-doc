import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';
import 'package:hope7/pages/our_team_page.dart';
import 'package:hope7/pages/principle_page.dart';
import 'package:hope7/pages/prototype_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope 7 Design Document',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
          labelStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 16),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.blueAccent, width: 3),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return Colors.blueAccent.withValues(alpha: 0.2);
            }
            return Colors.transparent;
          }),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
            TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
          },
        ),
      ),
      home: const TopNavPage(),
    );
  }
}

class TopNavPage extends StatefulWidget {
  const TopNavPage({super.key});

  @override
  State<TopNavPage> createState() => _TopNavPageState();
}

class _TopNavPageState extends State<TopNavPage> with TickerProviderStateMixin {
  int _selectedIndex = 1; // default to Prototype
  final List<Widget> _pages = const [
    OurTeamPage(),
    PrototypePage(initialSection: 'Homepage'),
    PrinciplePage(),
  ];
  final List<String> _tabs = ['Our Team', 'Prototype', 'Principles'];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPhone = screenWidth < 600;

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hope 7',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            onTap: (i) => setState(() => _selectedIndex = i),
            tabs:
                _tabs
                    .map(
                      (label) =>
                          Tab(child: Text(label, style: GoogleFonts.poppins())),
                    )
                    .toList(),
          ),
        ),
        body:
            isPhone
                // On phone: no page transition animation
                ? _pages[_selectedIndex]
                // On wider screens: use FadeThrough animation
                : PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (child, primary, secondary) => FadeThroughTransition(
                        animation: primary,
                        secondaryAnimation: secondary,
                        fillColor: Colors.blueAccent.withOpacity(0.15),
                        child: child,
                      ),
                  child: _pages[_selectedIndex],
                ),
      ),
    );
  }
}
