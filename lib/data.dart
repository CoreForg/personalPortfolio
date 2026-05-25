import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ProjectItem {
  final String title;
  final String desc;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final List<String> tags;

  const ProjectItem({
    required this.title,
    required this.desc,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.tags,
  });
}

class SessionItem {
  final IconData icon;
  final String title;
  final String timePrice;
  final String desc;

  const SessionItem({
    required this.icon,
    required this.title,
    required this.timePrice,
    required this.desc,
  });
}

class ResourceItem {
  final IconData icon;
  final String title;
  final String desc;
  final bool isFree;
  final String? price;
  final Color bgColor;
  final Color iconColor;

  const ResourceItem({
    required this.icon,
    required this.title,
    required this.desc,
    required this.isFree,
    this.price,
    required this.bgColor,
    required this.iconColor,
  });
}

class TestimonialItem {
  final String text;
  final String avatar;
  final Color avatarBg;
  final Color avatarColor;
  final String name;
  final String role;

  const TestimonialItem({
    required this.text,
    required this.avatar,
    required this.avatarBg,
    required this.avatarColor,
    required this.name,
    required this.role,
  });
}

final List<ProjectItem> allProjects = [
  const ProjectItem(
    title: 'ShopEase — E-commerce app',
    desc:
        'Full e-commerce platform with smart cart, secure payment gateways, live order tracking, and a comprehensive admin dashboard.',
    icon: TablerIcons.shopping_bag,
    iconColor: Color(0xFF854F0B),
    bgColor: Color(0xFFFAEEDA),
    tags: ['Flutter', 'Spring Boot', 'Stripe'],
  ),
  const ProjectItem(
    title: 'BookIt — Booking system',
    desc:
        'Versatile booking engine for salons, clinics, and gyms. Features multi-tenant admin dashboards and robust REST APIs.',
    icon: TablerIcons.calendar,
    iconColor: Color(0xFFEF9F27),
    bgColor: Color(0xFF111111),
    tags: ['Flutter', 'PostgreSQL', 'Redis'],
  ),
  const ProjectItem(
    title: 'FitTrack — Health & Fitness',
    desc:
        'Activity tracking app featuring real-time step counting, meal logging, and Apple Health integration.',
    icon: TablerIcons.heartbeat,
    iconColor: Color(0xFF9E1F1F),
    bgColor: Color(0xFFFFEBEB),
    tags: ['Flutter', 'HealthKit', 'Firebase'],
  ),
  const ProjectItem(
    title: 'SaaS Dashboard Pro',
    desc:
        'High-performance analytics dashboard for SaaS founders with deep metrics and live charts.',
    icon: TablerIcons.chart_pie,
    iconColor: Color(0xFF1C4C7E),
    bgColor: Color(0xFFE6F0FA),
    tags: ['Flutter Web', 'Spring Boot'],
  ),
];

final List<SessionItem> allSessions = [
  const SessionItem(
    icon: TablerIcons.brand_linkedin,
    title: 'LinkedIn tech posts',
    timePrice: 'Weekly',
    desc:
        'Short lessons from freelance projects, Flutter builds, and backend architecture.',
  ),
  const SessionItem(
    icon: TablerIcons.file_text,
    title: 'Build breakdowns',
    timePrice: 'Free',
    desc:
        'PDF notes, templates, and examples shared for developers who want to improve faster.',
  ),
  const SessionItem(
    icon: TablerIcons.brand_gumroad,
    title: 'Gumroad resource drops',
    timePrice: 'Free + paid',
    desc:
        'Templates, checklists, and PDFs for students, freelancers, and app builders.',
  ),
  const SessionItem(
    icon: TablerIcons.users_group,
    title: 'Developer community',
    timePrice: 'LinkedIn',
    desc:
        'Join the community for tech posts, project ideas, and freelance learning.',
  ),
];

final List<ResourceItem> allResources = [
  const ResourceItem(
    icon: TablerIcons.file_text,
    title: 'Flutter roadmap PDF',
    desc:
        'A beginner-friendly path for learning Flutter, projects to build, and common mistakes to avoid.',
    isFree: true,
    bgColor: Color(0xFFEAF3DE),
    iconColor: Color(0xFF3B6D11),
  ),
  const ResourceItem(
    icon: TablerIcons.file_code,
    title: 'Spring Boot API cheatsheet',
    desc:
        'Quick reference PDF for REST APIs, folder structure, validation, and production basics.',
    isFree: true,
    bgColor: Color(0xFFEAF3DE),
    iconColor: Color(0xFF3B6D11),
  ),
  const ResourceItem(
    icon: TablerIcons.brand_gumroad,
    title: 'Freelance proposal kit',
    desc:
        'Paid PDF pack with client brief format, proposal structure, pricing notes, and delivery checklist.',
    isFree: false,
    price: '₹299',
    bgColor: Color(0xFFFAEEDA),
    iconColor: Color(0xFF854F0B),
  ),
  const ResourceItem(
    icon: TablerIcons.template,
    title: 'Flutter app template pack',
    desc:
        'Reusable app screens, state patterns, API layer notes, and project setup guidance.',
    isFree: false,
    price: '₹199',
    bgColor: Color(0xFFFAEEDA),
    iconColor: Color(0xFF854F0B),
  ),
];

final List<TestimonialItem> allTestimonials = [
  const TestimonialItem(
    text:
        '"Delivered our Flutter app on time with exceptional code quality. Architecture is pristine and highly scalable. Highly recommend!"',
    avatar: 'SJ',
    avatarBg: Color(0xFFFAEEDA),
    avatarColor: Color(0xFF854F0B),
    name: 'Sarah J.',
    role: 'CEO · FinTech App Dev',
  ),
  const TestimonialItem(
    text:
        '"Backend architecture designed for scale. Handling 10k+ concurrent users on our Spring Boot services without a single hiccup."',
    avatar: 'MR',
    avatarBg: Color(0xFFEAF3DE),
    avatarColor: Color(0xFF3B6D11),
    name: 'Mark R.',
    role: 'CTO · Backend Systems',
  ),
  const TestimonialItem(
    text:
        '"The resources made Flutter and backend setup much clearer. The checklists are simple, practical, and easy to apply."',
    avatar: 'DK',
    avatarBg: Color(0xFFEEEDFE),
    avatarColor: Color(0xFF534AB7),
    name: 'David K.',
    role: 'Student · Resources',
  ),
  const TestimonialItem(
    text:
        '"The technical breakdowns are direct and useful. They helped us think more clearly about scaling and backend structure."',
    avatar: 'AN',
    avatarBg: Color(0xFFFEECEB),
    avatarColor: Color(0xFFD32F2F),
    name: 'Alex N.',
    role: 'Lead Engineer',
  ),
  const TestimonialItem(
    text:
        '"The templates saved me weeks of setup time. Highly recommended if you want to ship fast without reinventing the wheel."',
    avatar: 'PJ',
    avatarBg: Color(0xFFE0F7FA),
    avatarColor: Color(0xFF006064),
    name: 'Priya J.',
    role: 'Indie Hacker',
  ),
];
