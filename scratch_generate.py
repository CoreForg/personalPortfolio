import os

screens_dir = 'lib/screens'
os.makedirs(screens_dir, exist_ok=True)

# projects_page.dart
with open(f'{screens_dir}/projects_page.dart', 'w') as f:
    f.write('''import 'package:flutter/material.dart';
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
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: ProjectCard(title: allProjects[i].title, desc: allProjects[i].desc, icon: allProjects[i].icon, iconColor: allProjects[i].iconColor, bgColor: allProjects[i].bgColor, tags: allProjects[i].tags)),
              const SizedBox(width: 24),
              Expanded(child: i + 1 < allProjects.length ? ProjectCard(title: allProjects[i+1].title, desc: allProjects[i+1].desc, icon: allProjects[i+1].icon, iconColor: allProjects[i+1].iconColor, bgColor: allProjects[i+1].bgColor, tags: allProjects[i+1].tags) : const SizedBox()),
            ],
          ),
        ),
      );
      if (i + 2 < allProjects.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
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
''')

# products_page.dart
with open(f'{screens_dir}/products_page.dart', 'w') as f:
    f.write('''import 'package:flutter/material.dart';
import '../portfolio_page.dart';
import '../data.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    List<Widget> rows = [];
    for (int i = 0; i < allResources.length; i += 2) {
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: ResourceCard(title: allResources[i].title, desc: allResources[i].desc, icon: allResources[i].icon, iconColor: allResources[i].iconColor, bgColor: allResources[i].bgColor, isFree: allResources[i].isFree, price: allResources[i].price)),
              const SizedBox(width: 24),
              Expanded(child: i + 1 < allResources.length ? ResourceCard(title: allResources[i+1].title, desc: allResources[i+1].desc, icon: allResources[i+1].icon, iconColor: allResources[i+1].iconColor, bgColor: allResources[i+1].bgColor, isFree: allResources[i+1].isFree, price: allResources[i+1].price) : const SizedBox()),
            ],
          ),
        ),
      );
      if (i + 2 < allResources.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Templates & Assets', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF111111), letterSpacing: -1)),
                  const SizedBox(height: 16),
                  const Text('High-quality boilerplate codes and cheatsheets to accelerate your dev process.', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(height: 48),
                  isMobile 
                    ? Column(
                        children: allResources.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ResourceCard(title: p.title, desc: p.desc, icon: p.icon, iconColor: p.iconColor, bgColor: p.bgColor, isFree: p.isFree, price: p.price),
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
''')

# sessions_page.dart
with open(f'{screens_dir}/sessions_page.dart', 'w') as f:
    f.write('''import 'package:flutter/material.dart';
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
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: SessionCard(title: allSessions[i].title, desc: allSessions[i].desc, icon: allSessions[i].icon, timePrice: allSessions[i].timePrice)),
              const SizedBox(width: 24),
              Expanded(child: i + 1 < allSessions.length ? SessionCard(title: allSessions[i+1].title, desc: allSessions[i+1].desc, icon: allSessions[i+1].icon, timePrice: allSessions[i+1].timePrice) : const SizedBox()),
            ],
          ),
        ),
      );
      if (i + 2 < allSessions.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            SectionWrapper(
              backgroundColor: const Color(0xFFFAFAFA),
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mentorship & Sessions', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF111111), letterSpacing: -1)),
                  const SizedBox(height: 16),
                  const Text('Level up your development skills with 1-on-1 guidance.', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
                  const SizedBox(height: 48),
                  isMobile 
                    ? Column(
                        children: allSessions.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: SessionCard(title: p.title, desc: p.desc, icon: p.icon, timePrice: p.timePrice),
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
''')

# reviews_page.dart
with open(f'{screens_dir}/reviews_page.dart', 'w') as f:
    f.write('''import 'package:flutter/material.dart';
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
      rows.add(IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)));
      if (i + cols < allTestimonials.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Client Reviews', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF111111), letterSpacing: -1)),
                  const SizedBox(height: 16),
                  const Text('Don\\'t just take my word for it.', style: TextStyle(fontSize: 16, color: Color(0xFF666666))),
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
''')

# hire_me_page.dart
with open(f'{screens_dir}/hire_me_page.dart', 'w') as f:
    f.write('''import 'package:flutter/material.dart';
import '../portfolio_page.dart';

class HireMePage extends StatelessWidget {
  const HireMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: isDesktop
                    ? const IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: HireLeft()),
                            Expanded(child: HireForm()),
                          ],
                        ),
                      )
                    : const Column(
                        children: [
                          HireLeft(),
                          HireForm(),
                        ],
                      ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class HireLeft extends StatelessWidget {
  const HireLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111111),
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Let\\'s build something incredible.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2, letterSpacing: -1)),
          const SizedBox(height: 24),
          const Text('I am available for freelance projects and full-time roles. Drop a message below and I will get back to you within 24 hours.', style: TextStyle(fontSize: 15, color: Color(0xFFAAAAAA), height: 1.6)),
          const SizedBox(height: 48),
          const _ContactItem(icon: Icons.email_outlined, text: 'hello@shivam.dev'),
          const SizedBox(height: 16),
          const _ContactItem(icon: Icons.location_on_outlined, text: 'Delhi, India (Remote)'),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 16),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}

class HireForm extends StatelessWidget {
  const HireForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Send a message', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF111111))),
          const SizedBox(height: 32),
          const _InputLabel('Your Name'),
          const SizedBox(height: 8),
          const _InputField('John Doe'),
          const SizedBox(height: 24),
          const _InputLabel('Email Address'),
          const SizedBox(height: 8),
          const _InputField('john@company.com'),
          const SizedBox(height: 24),
          const _InputLabel('Project Details'),
          const SizedBox(height: 8),
          const _InputField('Tell me about your project...', maxLines: 4),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF9F27),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text('Send Message', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;
  const _InputLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111111)));
  }
}

class _InputField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const _InputField(this.hint, {this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF999999), fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE8E8E8), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE8E8E8), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEF9F27), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
''')
