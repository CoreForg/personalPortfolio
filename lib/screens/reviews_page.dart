import 'package:flutter/material.dart';
import '../portfolio_page.dart';
import '../data.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int cols = 3;
    if (width <= 900 && width > 600) cols = 2;
    if (width <= 600) cols = 1;

    List<Widget> rows = [];
    for (int i = 0; i < allTestimonials.length; i += cols) {
      List<Widget> children = [];
      for (int j = 0; j < cols; j++) {
        if (i + j < allTestimonials.length) {
          final t = allTestimonials[i + j];
          children.add(Expanded(child: TestimonialCard(text: t.text, avatar: t.avatar, avatarBg: t.avatarBg, avatarColor: t.avatarColor, name: t.name, role: t.role)));
        } else {
          children.add(const Expanded(child: SizedBox()));
        }
        if (j < cols - 1) children.add(const SizedBox(width: 24));
      }
      rows.add(Row(crossAxisAlignment: CrossAxisAlignment.start, children: children));
      if (i + cols < allTestimonials.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(activeRoute: '/reviews'),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Client Reviews', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF111111), letterSpacing: -1)),
                  const SizedBox(height: 16),
                  const Text('Don\'t just take my word for it.', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(height: 48),
                  cols == 1
                    ? Column(
                        children: allTestimonials.map((t) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TestimonialCard(text: t.text, avatar: t.avatar, avatarBg: t.avatarBg, avatarColor: t.avatarColor, name: t.name, role: t.role),
                        )).toList(),
                      )
                    : Column(children: rows),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
