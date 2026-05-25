import 'package:flutter/material.dart';
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
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ResourceCard(title: allResources[i].title, desc: allResources[i].desc, icon: allResources[i].icon, iconColor: allResources[i].iconColor, bgColor: allResources[i].bgColor, isFree: allResources[i].isFree, price: allResources[i].price)),
              const SizedBox(width: 24),
              Expanded(child: i + 1 < allResources.length ? ResourceCard(title: allResources[i+1].title, desc: allResources[i+1].desc, icon: allResources[i+1].icon, iconColor: allResources[i+1].iconColor, bgColor: allResources[i+1].bgColor, isFree: allResources[i+1].isFree, price: allResources[i+1].price) : const SizedBox()),
            ],
          ),
      );
      if (i + 2 < allResources.length) rows.add(const SizedBox(height: 24));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(activeRoute: '/products'),
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
