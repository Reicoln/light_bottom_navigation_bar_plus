# light_bottom_navigation_bar_plus

A fork of **light_bottom_navigation_bar** with enhanced UI/UX.  
A lightweight, animated, and customizable BottomNavigationBar widget for Flutter, now with optional **text labels under icons** and improved animation handling.

---

## ✨ Features

✅ **All original functionality** – smooth animated transitions, custom icon highlighting.  
🆕 **New** – support for text labels beneath icons, with customizable text styles.  
🎨 **Fully customizable** – colors, sizes, animation durations.  
⚡ **Lightweight** – easy to integrate into any Flutter project.

---

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  light_bottom_navigation_bar_plus: ^1.1.2
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
      theme: ThemeData.dark(), // Пример с тёмной темой
      home: Scaffold(
        body: const Center(
          child: Text('Your page content here'),
        ),
        bottomNavigationBar: LightBottomNavigationBarPlus(
          currentIndex: 0,
          height: 70,
          backgroundColor: Colors.black87,
          elevation: 8,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          onSelected: (index) => print('Selected tab: $index'),
          items: const [
            LightBottomNavigationBarPlusItem(
              unSelectedIcon: Icons.home_outlined,
              selectedIcon: Icons.home,
              title: Text(
                'Home',
                style: TextStyle(color: Colors.blue),
              ),
              size: 30,
              backgroundShadowColor: Colors.blue,
              borderBottomColor: Colors.blue,
              borderBottomWidth: 3,
              splashColor: Colors.blue,
              selectedIconColor: Colors.blue,
              unSelectedIconColor: Colors.blueGrey,
              highlightColor: Colors.lightBlueAccent,
              hoverColor: Colors.lightBlueAccent,
              selectedTitleColor: Colors.blue,
              unSelectedTitleColor: Colors.blueGrey,
            ),
            LightBottomNavigationBarPlusItem(
              unSelectedIcon: Icons.search_outlined,
              selectedIcon: Icons.search,
              title: Text(
                'Search',
                style: TextStyle(color: Colors.green),
              ),
              size: 30,
              backgroundShadowColor: Colors.green,
              borderBottomColor: Colors.green,
              borderBottomWidth: 3,
              splashColor: Colors.green,
              selectedIconColor: Colors.green,
              unSelectedIconColor: Colors.greenAccent,
              highlightColor: Colors.lightGreenAccent,
              hoverColor: Colors.lightGreenAccent,
              selectedTitleColor: Colors.green,
              unSelectedTitleColor: Colors.greenAccent,
            ),
            LightBottomNavigationBarPlusItem(
              unSelectedIcon: Icons.star_border_outlined,
              selectedIcon: Icons.star,
              title: Text(
                'Favorites',
                style: TextStyle(color: Colors.orange),
              ),
              size: 30,
              backgroundShadowColor: Colors.orange,
              borderBottomColor: Colors.orange,
              borderBottomWidth: 3,
              splashColor: Colors.orange,
              selectedIconColor: Colors.orange,
              unSelectedIconColor: Colors.orangeAccent,
              highlightColor: Colors.deepOrange,
              hoverColor: Colors.deepOrange,
              selectedTitleColor: Colors.orange,
              unSelectedTitleColor: Colors.orangeAccent,
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
- Text title under icons for better accessibility and clarity.  
- More flexible customization options for developers.  

Contributions, bug reports, or feature requests are welcome on the GitHub repository.

---

## 📝 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
