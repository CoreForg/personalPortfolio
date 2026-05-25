import 'package:flutter/material.dart';
import '../portfolio_page.dart';
import '../data.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    List<Widget> rows = [];
    for (int i = 0; i < allProjects.length; i += 2) {
      rows.add(
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ProjectCard(title: allProjects[i].title, desc: allProjects[i].desc, icon: allProjects[i].icon, iconColor: allProjects[i].iconColor, bgColor: allProjects[i].bgColor, tags: allProjects[i].tags)),
              const SizedBox(width: 24),
              Expanded(child: i + 1 < allProjects.length ? ProjectCard(title: allProjects[i+1].title, desc: allProjects[i+1].desc, icon: allProjects[i+1].icon, iconColor: allProjects[i+1].iconColor, bgColor: allProjects[i+1].bgColor, tags: allProjects[i+1].tags) : const SizedBox()),
            ],
          ),
      );
      if (i + 2 < allProjects.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(activeRoute: '/projects'),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('All Projects', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF111111), letterSpacing: -1)),
                  const SizedBox(height: 16),
                  const Text('A comprehensive list of my professional and personal work.', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(height: 48),
                  isMobile 
                    ? Column(
                        children: allProjects.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ProjectCard(title: p.title, desc: p.desc, icon: p.icon, iconColor: p.iconColor, bgColor: p.bgColor, tags: p.tags),
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
