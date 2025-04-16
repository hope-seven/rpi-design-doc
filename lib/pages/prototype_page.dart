import 'package:flutter/material.dart';
import 'package:hope7/components/divider_arrow.dart';
import 'package:hope7/content/prototype.dart';

class PrototypePage extends StatefulWidget {
  final String? initialSection;
  const PrototypePage({super.key, this.initialSection});

  @override
  State<PrototypePage> createState() => _PrototypePageState();
}

class _PrototypePageState extends State<PrototypePage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  final ValueNotifier<String?> _focusedSection = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    for (var item in pageItems) {
      _sectionKeys[item.title] = GlobalKey();
    }

    _scrollController.addListener(_handleScroll);

    // Scroll to initial section after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialSection != null) {
        _scrollToSection(widget.initialSection!);
      }
    });
  }

  void _scrollToSection(String title) {
    final key = _sectionKeys[title];
    if (key != null) {
      _focusedSection.value = title; // Set focused section
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleScroll() {
    for (var item in pageItems) {
      final key = _sectionKeys[item.title];
      final context = key?.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position >= 0 &&
            position <= MediaQuery.of(context).size.height * 0.5) {
          if (_focusedSection.value != item.title) {
            _focusedSection.value = item.title;
          }
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _focusedSection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          // Navigation column (30%)
          PrototypeNavBar(context),

          // Figma design viewer
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  for (int i = 0; i < pageItems.length; i++) ...[
                    // Page Section
                    Container(
                      key: _sectionKeys[pageItems[i].title],
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            pageItems[i].title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                            height: size.height * 0.01,
                            indent: size.width * 0.1,
                            endIndent: size.width * 0.1,
                          ),
                          const SizedBox(height: 12),
                          Image.asset(
                            pageItems[i].assetPath,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),

                    // Arrow Divider (except after last item)
                    if (i < pageItems.length - 1) DividerWithArrow(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PrototypeNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Collapse when too narrow
    if (screenWidth < 600) {
      return const SizedBox.shrink(); // completely remove nav
    }

    return Container(
      width: screenWidth * 0.3,
      color: Colors.grey.shade100,
      child: Center(
        child: ValueListenableBuilder<String?>(
          valueListenable: _focusedSection,
          builder: (context, focused, _) {
            return SingleChildScrollView(
              // <-- Wrap to prevent overflow even in mid-size
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    pageItems.map((item) {
                      final isFocused = focused == item.title;
                      return AnimatedScale(
                        scale: isFocused ? 1.1 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedOpacity(
                          opacity: isFocused ? 1.0 : 0.6,
                          duration: const Duration(milliseconds: 300),
                          child: ListTile(
                            title: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight:
                                    isFocused
                                        ? FontWeight.w800
                                        : FontWeight.normal,
                                color:
                                    isFocused
                                        ? Colors.blueAccent
                                        : Colors.black,
                              ),
                            ),
                            onTap: () {
                              _focusedSection.value = item.title;
                              _scrollToSection(item.title);
                            },
                          ),
                        ),
                      );
                    }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
