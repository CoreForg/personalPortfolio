import re

def fix_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # We need to find all occurrences of IntrinsicHeight(...)
    # Since regex can't easily match nested braces, we can just do string replacements for known patterns.

    # 1. Replace the start
    content = content.replace(
        "const IntrinsicHeight(\n                  child: Row(\n                    crossAxisAlignment: CrossAxisAlignment.stretch,",
        "const Row(\n                  crossAxisAlignment: CrossAxisAlignment.start,"
    )
    content = content.replace(
        "IntrinsicHeight(\n                          child: Row(\n                            crossAxisAlignment: CrossAxisAlignment.stretch,",
        "Row(\n                          crossAxisAlignment: CrossAxisAlignment.start,"
    )
    content = content.replace(
        "const IntrinsicHeight(\n                      child: Row(\n                        crossAxisAlignment: CrossAxisAlignment.stretch,",
        "const Row(\n                      crossAxisAlignment: CrossAxisAlignment.start,"
    )
    content = content.replace(
        "const IntrinsicHeight(\n                        child: Row(\n                          crossAxisAlignment: CrossAxisAlignment.stretch,",
        "const Row(\n                        crossAxisAlignment: CrossAxisAlignment.start,"
    )
    
    # In projects_page, products_page, sessions_page, reviews_page:
    content = content.replace(
        "IntrinsicHeight(\n          child: Row(\n            crossAxisAlignment: CrossAxisAlignment.stretch,",
        "Row(\n            crossAxisAlignment: CrossAxisAlignment.start,"
    )
    content = content.replace(
        "IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,",
        "Row(crossAxisAlignment: CrossAxisAlignment.start,"
    )

    # 2. Fix the extra closing parenthesis for known sections
    # Featured, Sessions, Resources
    content = content.replace(
        "                    ],\n                  ),\n                ),",
        "                    ],\n                  ),"
    )
    # Testimonials (tablet)
    content = content.replace(
        "                            ],\n                          ),\n                        ),",
        "                            ],\n                          ),"
    )
    # Testimonials (desktop)
    content = content.replace(
        "                        ],\n                      ),\n                    ),",
        "                        ],\n                      ),"
    )
    # Generated pages (rows inside loop)
    content = content.replace(
        "            ],\n          ),\n        ),\n      );",
        "            ],\n          ),\n      );"
    )
    # reviews_page.dart
    content = content.replace(
        "rows.add(IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)));",
        "rows.add(Row(crossAxisAlignment: CrossAxisAlignment.start, children: children));"
    )

    with open(filepath, 'w') as f:
        f.write(content)

import glob
files = glob.glob('lib/**/*.dart', recursive=True)
for f in files:
    fix_file(f)
