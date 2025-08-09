# light_bottom_navigation_bar_plus

A fork of **light_bottom_navigation_bar** with enhanced UI/UX.  
A lightweight, animated, and customizable BottomNavigationBar widget for Flutter, now with optional **text labels under icons** and improved animation handling.

---

## ✨ Features

- ✅ All original functionality: smooth animated transitions, custom icon highlighting.  
- 🆕 **New:** Support for text labels beneath icons, with customizable text styles.  
- 🎨 Fully customizable: colors, sizes, animation durations.  
- ⚡ Lightweight and easy to integrate into any Flutter project.

---

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  light_bottom_navigation_bar_plus: ^1.0.1
```

Import the package:

```dart
import 'package:light_bottom_navigation_bar_plus/light_bottom_navigation_bar_plus.dart';
```

---

## 🚀 Usage Example

```dart
import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar_plus/light_bottom_navigation_bar_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text('Your page content here'),
        ),
        bottomNavigationBar: LightBottomNavigationBar(
          currentIndex: 1,
          onSelected: (index) => print('Selected tab: $index'),
          items: const [
            LightBottomNavigationBarItem(
              unSelectedIcon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
            ),
            LightBottomNavigationBarItem(
              unSelectedIcon: Icons.search_outlined,
              selectedIcon: Icons.search,
              label: 'Search',
            ),
            LightBottomNavigationBarItem(
              unSelectedIcon: Icons.star_border_outlined,
              selectedIcon: Icons.star,
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📖 Additional Information

This package enhances the original **light_bottom_navigation_bar** by adding:  
- Text labels under icons for better accessibility and clarity.  
- More flexible customization options for developers.  

Contributions, bug reports, or feature requests are welcome on the GitHub repository.

---

## 📝 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
