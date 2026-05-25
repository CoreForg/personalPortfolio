import 'package:flutter/material.dart';
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
            const NavBar(activeRoute: '/hire'),
            SectionWrapper(
              topPadding: 100,
              bottomPadding: 100,
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
                          Expanded(child: HireLeft()),
                          Expanded(child: HireForm()),
                        ],
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
          const Text('Let\'s build something incredible.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2, letterSpacing: -1)),
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
