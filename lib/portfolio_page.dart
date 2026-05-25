import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            _HeroSection(),
            _StatsBar(),
            _FeaturedWork(),
            _SessionsSection(),
            _ResourcesSection(),
            _TestimonialsSection(),
            _HireSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Border? border;
  final double topPadding;
  final double bottomPadding;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.border,
    this.topPadding = 80,
    this.bottomPadding = 80,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;
    final isTablet = width > 600 && width <= 900;

    double horizontalPad = 24.0;
    if (isDesktop) horizontalPad = 64.0;
    if (isTablet) horizontalPad = 40.0;

    double verticalMult = isDesktop ? 1.0 : (isTablet ? 0.8 : 0.6);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
      ),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.only(
              left: horizontalPad,
              right: horizontalPad,
              top: topPadding * verticalMult,
              bottom: bottomPadding * verticalMult,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final String activeRoute;
  const NavBar({super.key, this.activeRoute = '/'});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 768;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE8E8E8), width: 0.5)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 64 : 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (activeRoute != '/') {
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Text(
                    'DevPortfolio',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: Color(0xFF111111)),
                  ),
                ),
                if (isDesktop)
                  Row(
                    children: [
                      _NavLink('Projects', '/projects', active: activeRoute == '/projects'),
                      const SizedBox(width: 24),
                      _NavLink('Products', '/products', active: activeRoute == '/products'),
                      const SizedBox(width: 24),
                      _NavLink('Sessions', '/sessions', active: activeRoute == '/sessions'),
                      const SizedBox(width: 24),
                      _NavLink('Reviews', '/reviews', active: activeRoute == '/reviews'),
                      const SizedBox(width: 24),
                      _NavLink('Hire me', '/hire', active: activeRoute == '/hire'),
                    ],
                  ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF111111),
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFF111111), width: 1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Book a call', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final String route;
  final bool active;

  const _NavLink(this.text, this.route, {this.active = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!active) {
          Navigator.pushNamed(context, route);
        }
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(bottom: 2),
        decoration: active
            ? const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF111111), width: 1.5)))
            : null,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: active ? FontWeight.w500 : FontWeight.w400,
            color: active ? const Color(0xFF111111) : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;

    return SectionWrapper(
      topPadding: 100,
      bottomPadding: 100,
      child: isDesktop
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _HeroLeft()),
                SizedBox(width: 80),
                Expanded(flex: 4, child: _HeroRight()),
              ],
            )
          : const Column(
              children: [
                _HeroLeft(),
                SizedBox(height: 60),
                _HeroRight(),
              ],
            ),
    );
  }
}

class _HeroLeft extends StatelessWidget {
  const _HeroLeft();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;
    
    final double headingSize = isDesktop ? 56 : 36;
    final double subTextSize = isDesktop ? 16 : 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFAEEDA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(color: Color(0xFFEF9F27), shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              const Text('Available for new projects', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF854F0B))),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: headingSize, fontWeight: FontWeight.w600, height: 1.1, letterSpacing: -1, color: const Color(0xFF111111), fontFamily: 'Inter'),
            children: const [
              TextSpan(text: "Hi, I'm Shivam —\n"),
              TextSpan(text: "Full-Stack\n", style: TextStyle(color: Color(0xFFEF9F27))),
              TextSpan(text: "Mobile Dev"),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I craft high-performance mobile apps with Flutter and build resilient backends using Spring Boot + PostgreSQL. Delivering scale and precision.',
          style: TextStyle(fontSize: subTextSize, color: const Color(0xFF666666), height: 1.6),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _TechTag('Flutter'),
            _TechTag('Spring Boot'),
            _TechTag('PostgreSQL'),
            _TechTag('REST APIs'),
            _TechTag('System Design'),
          ],
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(TablerIcons.eye, size: 16),
              label: const Text('View projects', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF9F27),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(TablerIcons.calendar, size: 16),
              label: const Text('Book session ₹399', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF111111),
                side: const BorderSide(color: Color(0xFF222222), width: 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;

  const _TechTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF555555))),
    );
  }
}

class _HeroRight extends StatelessWidget {
  const _HeroRight();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 350),
      decoration: BoxDecoration(
        color: const Color(0xFFEF9F27),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 2),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 2),
              ),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: const Icon(TablerIcons.user, size: 56, color: Color(0xFFEF9F27)),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('50+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF111111))),
                  Text('Projects delivered', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF666666))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsBar extends StatelessWidget {
  const _StatsBar();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(
          top: BorderSide(color: Color(0xFFE8E8E8), width: 1),
          bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: isMobile
                ? const Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _StatItem(num: '50+', label: 'Projects delivered')),
                          Expanded(child: _StatItem(num: '100+', label: 'Mentorship sessions')),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: _StatItem(num: '40+', label: 'Happy clients')),
                          Expanded(child: _StatItem(num: '5k+', label: 'LinkedIn followers')),
                        ],
                      ),
                    ],
                  )
                : const Row(
                    children: [
                      Expanded(child: _StatItem(num: '50+', label: 'Projects delivered')),
                      Expanded(child: _StatItem(num: '100+', label: 'Mentorship sessions')),
                      Expanded(child: _StatItem(num: '40+', label: 'Happy clients')),
                      Expanded(child: _StatItem(num: '5k+', label: 'LinkedIn followers')),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String num;
  final String label;

  const _StatItem({required this.num, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(num, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: -1, color: Color(0xFF111111))),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF666666))),
      ],
    );
  }
}

class _FeaturedWork extends StatelessWidget {
  const _FeaturedWork();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    return SectionWrapper(
      topPadding: 100,
      bottomPadding: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured work', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: Color(0xFF111111))),
                  SizedBox(height: 8),
                  Text('Production-ready apps built with scale in mind.', style: TextStyle(fontSize: 15, color: Color(0xFF666666))),
                ],
              ),
              if (width > 600)
                _SeeAllBtn('View all projects'),
            ],
          ),
          const SizedBox(height: 40),
          isMobile
              ? const Column(
                  children: [
                    ProjectCard(
                      title: 'ShopEase — E-commerce app',
                      desc: 'Full e-commerce platform with smart cart, secure payment gateways, live order tracking, and a comprehensive admin dashboard.',
                      icon: TablerIcons.shopping_bag,
                      iconColor: Color(0xFF854F0B),
                      bgColor: Color(0xFFFAEEDA),
                      tags: ['Flutter', 'Spring Boot', 'Stripe'],
                    ),
                    SizedBox(height: 24),
                    ProjectCard(
                      title: 'BookIt — Booking system',
                      desc: 'Versatile booking engine for salons, clinics, and gyms. Features multi-tenant admin dashboards and robust REST APIs.',
                      icon: TablerIcons.calendar,
                      iconColor: Color(0xFFEF9F27),
                      bgColor: Color(0xFF111111),
                      tags: ['Flutter', 'PostgreSQL', 'Redis'],
                    ),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProjectCard(
                          title: 'ShopEase — E-commerce app',
                          desc: 'Full e-commerce platform with smart cart, secure payment gateways, live order tracking, and a comprehensive admin dashboard.',
                          icon: TablerIcons.shopping_bag,
                          iconColor: Color(0xFF854F0B),
                          bgColor: Color(0xFFFAEEDA),
                          tags: ['Flutter', 'Spring Boot', 'Stripe'],
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: ProjectCard(
                          title: 'BookIt — Booking system',
                          desc: 'Versatile booking engine for salons, clinics, and gyms. Features multi-tenant admin dashboards and robust REST APIs.',
                          icon: TablerIcons.calendar,
                          iconColor: Color(0xFFEF9F27),
                          bgColor: Color(0xFF111111),
                          tags: ['Flutter', 'PostgreSQL', 'Redis'],
                        ),
                      ),
                    ],
                  ),
          if (width <= 600)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(child: _SeeAllBtn('View all projects')),
            ),
        ],
      ),
    );
  }
}

class _SeeAllBtn extends StatelessWidget {
  final String label;

  const _SeeAllBtn(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF111111))),
          const SizedBox(width: 6),
          const Icon(TablerIcons.arrow_right, size: 14, color: Color(0xFF111111)),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(icon, size: 64, color: iconColor),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((t) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(t, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
                const SizedBox(height: 8),
                Text(desc, style: const TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.5)),
                const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF9F27),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: const Text('View project', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(TablerIcons.brand_github, size: 18, color: Color(0xFF666666)),
                          const SizedBox(width: 6),
                          const Text('GitHub', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF666666))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SessionsSection extends StatelessWidget {
  const _SessionsSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    return SectionWrapper(
      backgroundColor: const Color(0xFFFAFAFA),
      topPadding: 80,
      bottomPadding: 80,
      border: const Border(
        top: BorderSide(color: Color(0xFFE8E8E8), width: 1),
        bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mentorship & sessions', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: Color(0xFF111111))),
          const SizedBox(height: 8),
          const Text('Level up your development skills with 1-on-1 guidance.', style: TextStyle(fontSize: 15, color: Color(0xFF666666))),
          const SizedBox(height: 40),
          isMobile
              ? const Column(
                  children: [
                    SessionCard(icon: TablerIcons.route, title: 'Flutter doubt session', timePrice: '30 min · ₹399', desc: 'Stuck on a bug? Let\'s fix it together.'),
                    SizedBox(height: 24),
                    SessionCard(icon: TablerIcons.code, title: 'Code & project review', timePrice: '45 min · ₹599', desc: 'Deep dive into your architecture and code quality.'),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: SessionCard(icon: TablerIcons.route, title: 'Flutter doubt session', timePrice: '30 min · ₹399', desc: 'Stuck on a bug? Let\'s fix it together.')),
                      SizedBox(width: 24),
                      Expanded(child: SessionCard(icon: TablerIcons.code, title: 'Code & project review', timePrice: '45 min · ₹599', desc: 'Deep dive into your architecture and code quality.')),
                    ],
                  ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String timePrice;
  final String desc;

  const SessionCard({super.key, required this.icon, required this.title, required this.timePrice, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAEEDA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 24, color: const Color(0xFF854F0B)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
                    const SizedBox(height: 4),
                    Text(desc, style: const TextStyle(fontSize: 13, color: Color(0xFF666666)), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(TablerIcons.clock, size: 14, color: Color(0xFF888888)),
                  const SizedBox(width: 6),
                  Text(timePrice, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF666666))),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111111),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text('Book now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ResourcesSection extends StatelessWidget {
  const _ResourcesSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;

    return SectionWrapper(
      topPadding: 80,
      bottomPadding: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Resources & Templates', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: Color(0xFF111111))),
          const SizedBox(height: 8),
          const Text('High-quality boilerplate codes and cheatsheets to accelerate your dev process.', style: TextStyle(fontSize: 15, color: Color(0xFF666666))),
          const SizedBox(height: 40),
          
          const Text('Free resources', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
          const SizedBox(height: 20),
          isMobile
              ? const Column(
                  children: [
                    ResourceCard(icon: TablerIcons.download, title: 'Flutter starter kit', desc: 'Production-ready boilerplate with Clean Architecture routing and state management pre-configured.', isFree: true, bgColor: Color(0xFFEAF3DE), iconColor: Color(0xFF3B6D11)),
                    SizedBox(height: 24),
                    ResourceCard(icon: TablerIcons.file_code, title: 'REST API cheatsheet', desc: 'Complete Spring Boot REST API quick reference PDF with best practices.', isFree: true, bgColor: Color(0xFFEAF3DE), iconColor: Color(0xFF3B6D11)),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ResourceCard(icon: TablerIcons.download, title: 'Flutter starter kit', desc: 'Production-ready boilerplate with Clean Architecture routing and state management pre-configured.', isFree: true, bgColor: Color(0xFFEAF3DE), iconColor: Color(0xFF3B6D11))),
                      SizedBox(width: 24),
                      Expanded(child: ResourceCard(icon: TablerIcons.file_code, title: 'REST API cheatsheet', desc: 'Complete Spring Boot REST API quick reference PDF with best practices.', isFree: true, bgColor: Color(0xFFEAF3DE), iconColor: Color(0xFF3B6D11))),
                    ],
                  ),
          
          const SizedBox(height: 48),
          
          const Text('Premium templates', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
          const SizedBox(height: 20),
          isMobile
              ? const Column(
                  children: [
                    ResourceCard(icon: TablerIcons.server, title: 'Spring Boot pro template', desc: 'Microservices template with Docker, Kubernetes configs, and CI/CD ready.', isFree: false, price: '₹299', bgColor: Color(0xFFFAEEDA), iconColor: Color(0xFF854F0B)),
                    SizedBox(height: 24),
                    ResourceCard(icon: TablerIcons.device_mobile, title: 'Flutter MVVM boilerplate', desc: 'Full MVVM architecture starter with GetX, local caching, and robust API layer.', isFree: false, price: '₹199', bgColor: Color(0xFFFAEEDA), iconColor: Color(0xFF854F0B)),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ResourceCard(icon: TablerIcons.server, title: 'Spring Boot pro template', desc: 'Microservices template with Docker, Kubernetes configs, and CI/CD ready.', isFree: false, price: '₹299', bgColor: Color(0xFFFAEEDA), iconColor: Color(0xFF854F0B))),
                      SizedBox(width: 24),
                      Expanded(child: ResourceCard(icon: TablerIcons.device_mobile, title: 'Flutter MVVM boilerplate', desc: 'Full MVVM architecture starter with GetX, local caching, and robust API layer.', isFree: false, price: '₹199', bgColor: Color(0xFFFAEEDA), iconColor: Color(0xFF854F0B))),
                    ],
                  ),
        ],
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final bool isFree;
  final String? price;
  final Color bgColor;
  final Color iconColor;

  const ResourceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.isFree,
    this.price,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 24, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(desc, style: const TextStyle(fontSize: 13, color: Color(0xFF666666), height: 1.5)),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              isFree
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF3DE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('Free resource', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF3B6D11))),
                    )
                  : Text(price ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF9F27),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: Text(isFree ? 'Download' : 'Buy now', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 600;
    final isTablet = width > 600 && width <= 900;

    return SectionWrapper(
      backgroundColor: const Color(0xFFFAFAFA),
      topPadding: 80,
      bottomPadding: 80,
      border: const Border(
        top: BorderSide(color: Color(0xFFE8E8E8), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Client testimonials', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: Color(0xFF111111))),
          const SizedBox(height: 8),
          const Text('Don\'t just take my word for it.', style: TextStyle(fontSize: 15, color: Color(0xFF666666))),
          const SizedBox(height: 40),
          isMobile
              ? const Column(
                  children: [
                    TestimonialCard(
                      text: '"Delivered our Flutter app on time with exceptional code quality. Architecture is pristine and highly scalable. Highly recommend!"',
                      avatar: 'SJ',
                      avatarBg: Color(0xFFFAEEDA),
                      avatarColor: Color(0xFF854F0B),
                      name: 'Sarah J.',
                      role: 'CEO · FinTech App Dev',
                    ),
                    SizedBox(height: 24),
                    TestimonialCard(
                      text: '"Backend architecture designed for scale. Handling 10k+ concurrent users on our Spring Boot services without a single hiccup."',
                      avatar: 'MR',
                      avatarBg: Color(0xFFEAF3DE),
                      avatarColor: Color(0xFF3B6D11),
                      name: 'Mark R.',
                      role: 'CTO · Backend Systems',
                    ),
                    SizedBox(height: 24),
                    TestimonialCard(
                      text: '"The mentorship session completely changed my approach to Flutter development. I learned more in 45 mins than in weeks of tutorials."',
                      avatar: 'DK',
                      avatarBg: Color(0xFFEEEDFE),
                      avatarColor: Color(0xFF534AB7),
                      name: 'David K.',
                      role: 'Student · Mentorship',
                    ),
                  ],
                )
              : isTablet
                  ? const Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TestimonialCard(
                                  text: '"Delivered our Flutter app on time with exceptional code quality. Architecture is pristine and highly scalable. Highly recommend!"',
                                  avatar: 'SJ',
                                  avatarBg: Color(0xFFFAEEDA),
                                  avatarColor: Color(0xFF854F0B),
                                  name: 'Sarah J.',
                                  role: 'CEO · FinTech App Dev',
                                ),
                              ),
                              SizedBox(width: 24),
                              Expanded(
                                child: TestimonialCard(
                                  text: '"Backend architecture designed for scale. Handling 10k+ concurrent users on our Spring Boot services without a single hiccup."',
                                  avatar: 'MR',
                                  avatarBg: Color(0xFFEAF3DE),
                                  avatarColor: Color(0xFF3B6D11),
                                  name: 'Mark R.',
                                  role: 'CTO · Backend Systems',
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TestimonialCard(
                                  text: '"The mentorship session completely changed my approach to Flutter development. I learned more in 45 mins than in weeks of tutorials."',
                                  avatar: 'DK',
                                  avatarBg: Color(0xFFEEEDFE),
                                  avatarColor: Color(0xFF534AB7),
                                  name: 'David K.',
                                  role: 'Student · Mentorship',
                                ),
                              ),
                              SizedBox(width: 24),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                      ],
                    )
                  : const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TestimonialCard(
                              text: '"Delivered our Flutter app on time with exceptional code quality. Architecture is pristine and highly scalable. Highly recommend!"',
                              avatar: 'SJ',
                              avatarBg: Color(0xFFFAEEDA),
                              avatarColor: Color(0xFF854F0B),
                              name: 'Sarah J.',
                              role: 'CEO · FinTech App Dev',
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: TestimonialCard(
                              text: '"Backend architecture designed for scale. Handling 10k+ concurrent users on our Spring Boot services without a single hiccup."',
                              avatar: 'MR',
                              avatarBg: Color(0xFFEAF3DE),
                              avatarColor: Color(0xFF3B6D11),
                              name: 'Mark R.',
                              role: 'CTO · Backend Systems',
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: TestimonialCard(
                              text: '"The mentorship session completely changed my approach to Flutter development. I learned more in 45 mins than in weeks of tutorials."',
                              avatar: 'DK',
                              avatarBg: Color(0xFFEEEDFE),
                              avatarColor: Color(0xFF534AB7),
                              name: 'David K.',
                              role: 'Student · Mentorship',
                            ),
                          ),
                        ],
                      ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String text;
  final String avatar;
  final Color avatarBg;
  final Color avatarColor;
  final String name;
  final String role;

  const TestimonialCard({
    super.key,
    required this.text,
    required this.avatar,
    required this.avatarBg,
    required this.avatarColor,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('★★★★★', style: TextStyle(color: Color(0xFFEF9F27), fontSize: 16, letterSpacing: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(text, style: const TextStyle(fontSize: 14, color: Color(0xFF555555), height: 1.6, fontStyle: FontStyle.italic)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: avatarBg,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(avatar, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: avatarColor)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF111111)), maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(role, style: const TextStyle(fontSize: 12, color: Color(0xFF888888)), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HireSection extends StatelessWidget {
  const _HireSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 768;

    return SectionWrapper(
      topPadding: 100,
      bottomPadding: 100,
      border: const Border(top: BorderSide(color: Color(0xFFE8E8E8), width: 1)),
      child: Container(
        decoration: BoxDecoration(
          color: isDesktop ? null : Colors.white,
          gradient: isDesktop ? const LinearGradient(colors: [Color(0xFF111111), Colors.white], stops: [0.5, 0.5]) : null,
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
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _HireLeft()),
                  Expanded(child: _HireRight()),
                ],
              )
            : const Column(
                children: [
                  _HireLeft(),
                  _HireRight(),
                ],
              ),
      ),
    );
  }
}

class _HireLeft extends StatelessWidget {
  const _HireLeft();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: const Color(0xFF111111),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Work with me', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: -1, color: Colors.white)),
          SizedBox(height: 16),
          Text('Let\'s build something scalable together. Open for freelance opportunities, app development, and technical consulting.', style: TextStyle(fontSize: 15, color: Color(0xFFAAAAAA), height: 1.6)),
          SizedBox(height: 48),
          _HireMetaItem(icon: TablerIcons.at, text: 'shivam@portfolio.dev'),
          SizedBox(height: 16),
          _HireMetaItem(icon: TablerIcons.brand_linkedin, text: 'LinkedIn / shivamgupta'),
          SizedBox(height: 16),
          _HireMetaItem(icon: TablerIcons.brand_github, text: 'GitHub / shivamdev'),
        ],
      ),
    );
  }
}

class _HireMetaItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HireMetaItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFEF9F27)),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
      ],
    );
  }
}

class _HireRight extends StatelessWidget {
  const _HireRight();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _FormField(label: 'Name', hint: 'John Doe'),
          const SizedBox(height: 20),
          const _FormField(label: 'Email', hint: 'john@company.com'),
          const SizedBox(height: 20),
          const _FormField(label: 'Project brief', hint: 'Tell me about your project...', maxLines: 4),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF9F27),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text('Submit brief', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;

  const _FormField({required this.label, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(fontSize: 14, color: Color(0xFF111111)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE8E8E8), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF111111), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 600;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE8E8E8), width: 1)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: isMobile
                ? const Column(
                    children: [
                      Text('DevPortfolio', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(TablerIcons.brand_github, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_linkedin, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_twitter, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_youtube, size: 20, color: Color(0xFF888888)),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text('© 2025 Full-stack dev portfolio', style: TextStyle(fontSize: 12, color: Color(0xFFBBBBBB))),
                    ],
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DevPortfolio', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF111111))),
                      Row(
                        children: [
                          Icon(TablerIcons.brand_github, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_linkedin, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_twitter, size: 20, color: Color(0xFF888888)),
                          SizedBox(width: 24),
                          Icon(TablerIcons.brand_youtube, size: 20, color: Color(0xFF888888)),
                        ],
                      ),
                      Text('© 2025 Full-stack dev portfolio', style: TextStyle(fontSize: 12, color: Color(0xFFBBBBBB))),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
