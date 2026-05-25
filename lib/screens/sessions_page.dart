import 'package:flutter/material.dart';
import '../portfolio_page.dart';
import '../data.dart';

class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    List<Widget> rows = [];
    for (int i = 0; i < allSessions.length; i += 2) {
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SessionCard(
                title: allSessions[i].title,
                desc: allSessions[i].desc,
                icon: allSessions[i].icon,
                timePrice: allSessions[i].timePrice,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: i + 1 < allSessions.length
                  ? SessionCard(
                      title: allSessions[i + 1].title,
                      desc: allSessions[i + 1].desc,
                      icon: allSessions[i + 1].icon,
                      timePrice: allSessions[i + 1].timePrice,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      );
      if (i + 2 < allSessions.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(activeRoute: '/sessions'),
            SectionWrapper(
              backgroundColor: const Color(0xFFFAFAFA),
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Knowledge Sharing',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111111),
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'LinkedIn posts, free notes, Gumroad resources, and community learning.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                  ),
                  const SizedBox(height: 48),
                  isMobile
                      ? Column(
                          children: allSessions
                              .map(
                                (p) => Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: SessionCard(
                                    title: p.title,
                                    desc: p.desc,
                                    icon: p.icon,
                                    timePrice: p.timePrice,
                                  ),
                                ),
                              )
                              .toList(),
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
