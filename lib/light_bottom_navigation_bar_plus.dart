library light_bottom_navigation_bar_plus;


/* Imports */

import 'package:flutter/material.dart';

/* Main Class */

///Amazing BottomNavigationBar plus widget , you can use it for your pro UI/UX
// ignore: must_be_immutable
class LightBottomNavigationBarPlus extends StatefulWidget {
  ///The Constructor of LightBottomNavigationBar.
  ///items is required.
  LightBottomNavigationBarPlus({super.key,
    required this.items,
    this.currentIndex = 0,
    this.height = 70.0,
    this.backgroundColor = const Color(0xFF191919),
    this.padding = EdgeInsets.zero,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 400),
    this.elevation = 8,
    this.onSelected,
  })  : assert(items.isNotEmpty),
        assert(items.length <= 10),
        assert(currentIndex < items.length),
        assert(currentIndex >= 0),
        assert(height >= 25),
  // assert(backgroundColor != null),
  // assert(curve != null),
  // assert(duration != null),
        assert(elevation >= 0.0);
  // assert(padding != null);

  /* Variables */

  ///[items] List of LightBottomNavigationBarItem to show them in your BottomNavigationBar.
  final List<LightBottomNavigationBarPlusItem> items;

  ///[currentIndex] The tab to display.
  final int currentIndex;

  ///[height] Height of the BottomNavigationBar.
  final double height;

  ///[backgroundColor] backgroundColor of BottomNavigationBar.
  final Color backgroundColor;

  ///[curve] The transition curve.
  final Curve curve;

  ///[duration] The transition duration.
  final Duration duration;

  ///[padding] The padding surrounding the entire widget.
  ///
  /// You can use to adding floating effect.
  final EdgeInsets padding;

  ///[elevation] The elevation of the widget.
  final double elevation;

  ///[onSelected] Callback method , Return the index of the tab that was tapping.
  ValueChanged<int>? onSelected = (int index) {};

  @override

  /// Creating state fo LightBottomNavigationBar.
  State<StatefulWidget> createState() => _LightBottomNavigationBarPlusState();
}

/* LightBottomNavigationBar Widget Class */

/// This class is represent BottomNavigationBar Widget.
class _LightBottomNavigationBarPlusState extends State<LightBottomNavigationBarPlus> {
  /// This class is represent BottomNavigationBar Widget.
  int selected = 0;

  @override

  /// using the widget.
  LightBottomNavigationBarPlus get widget => super.widget;

  @override

  /// When initialize the widget.
  void initState() {
    /// Super initialize.
    super.initState();

    selected = widget.currentIndex;
  }

  @override

  /// Building the widget.
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Material(
        color: widget.backgroundColor,
        elevation: widget.elevation,
        child: InkWell(
          child: Row(
            children: List.generate(
                widget.items.length,
                    (index) => Expanded(
                  child: LightNavItem(
                    item: widget.items[index],
                    selected: selected == index,
                    height: widget.height,
                    curve: widget.curve,
                    duration: widget.duration,
                    changeIndex: () {
                      ///Change the state.
                      setState(() {});
                      selected = index;
                      widget.onSelected!(index);
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

/* LightNavItem Widget Class */

/// A tab to display in LightBottomNavigationBar.
class LightNavItem extends StatelessWidget {
  const LightNavItem({
    super.key,
    required this.item,
    required this.selected,
    required this.height,
    required this.curve,
    required this.duration,
    required this.changeIndex,
  });

  final LightBottomNavigationBarPlusItem item;
  final bool selected;
  final double height;
  final Duration duration;
  final Curve curve;
  final GestureTapCallback changeIndex;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: changeIndex,
        highlightColor: item.highlightColor.withOpacity(0.6),
        splashColor: item.splashColor.withOpacity(0.4),
        hoverColor: item.hoverColor.withOpacity(0.6),
        child: Ink(
          child: AnimatedContainer(
            height: height,
            duration: duration,
            curve: curve,
            decoration: BoxDecoration(
              border: selected
                  ? Border(
                  bottom: BorderSide(
                      color: item.borderBottomColor,
                      width: item.borderBottomWidth))
                  : const Border(
                  bottom: BorderSide(color: Colors.transparent, width: 0)),
              gradient: selected
                  ? LinearGradient(
                colors: [
                  item.backgroundShadowColor.withOpacity(0.5),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
                  : const LinearGradient(
                colors: [Colors.transparent, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selected ? item.selectedIcon : item.unSelectedIcon,
                  size: selected ? item.size : item.size - 5,
                  color: selected
                      ? item.selectedIconColor
                      : item.unSelectedIconColor.withOpacity(0.5),
                ),
                if (item.label.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: selected
                        ? item.selectedTextStyle
                        : item.unSelectedTextStyle,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* Model Class */

/// A tab to display in LightBottomNavigationBar.
class LightBottomNavigationBarPlusItem {
  const LightBottomNavigationBarPlusItem({
    this.unSelectedIcon = Icons.star_border_outlined,
    this.selectedIcon = Icons.star,
    this.size = 30,
    this.selectedIconColor = Colors.white,
    this.unSelectedIconColor = Colors.white54,
    this.highlightColor = Colors.transparent,
    this.splashColor = Colors.transparent,
    this.hoverColor = Colors.transparent,
    this.borderBottomColor = const Color(0xFF6c5ce7),
    this.borderBottomWidth = 3,
    this.backgroundShadowColor = const Color(0xFF6c5ce7),
    this.label = '', // 🔹 новое поле
    this.selectedTextStyle = const TextStyle(color: Colors.white, fontSize: 12),
    this.unSelectedTextStyle = const TextStyle(color: Colors.white54, fontSize: 12),
  })  : assert(size >= 7),
        assert(borderBottomWidth >= 1);

  final IconData unSelectedIcon;
  final IconData selectedIcon;
  final double size;
  final Color selectedIconColor;
  final Color unSelectedIconColor;
  final Color highlightColor;
  final Color splashColor;
  final Color hoverColor;
  final Color borderBottomColor;
  final double borderBottomWidth;
  final Color backgroundShadowColor;
  final String label;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
}

