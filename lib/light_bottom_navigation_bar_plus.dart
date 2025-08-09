library light_bottom_navigation_bar_plus;

/* Imports */
import 'package:flutter/material.dart';

/* Main Class */

// ignore: must_be_immutable
class LightBottomNavigationBarPlus extends StatefulWidget {
  LightBottomNavigationBarPlus({
    super.key,
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
        assert(elevation >= 0.0);

  final List<LightBottomNavigationBarPlusItem> items;
  final int currentIndex;
  final double height;
  final Color backgroundColor;
  final Curve curve;
  final Duration duration;
  final EdgeInsets padding;
  final double elevation;
  ValueChanged<int>? onSelected = (int index) {};

  @override
  State<StatefulWidget> createState() => _LightBottomNavigationBarPlusState();
}

/* LightBottomNavigationBar Widget Class */

class _LightBottomNavigationBarPlusState
    extends State<LightBottomNavigationBarPlus> {
  int selected = 0;

  @override
  LightBottomNavigationBarPlus get widget => super.widget;

  @override
  void initState() {
    super.initState();
    selected = widget.currentIndex;
  }

  @override
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
                    setState(() {});
                    selected = index;
                    widget.onSelected!(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* LightNavItem Widget Class */

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
                      bottom:
                          BorderSide(color: Colors.transparent, width: 0)),
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
                if (item.title != null) ...[
                  const SizedBox(height: 4),
                  _buildTitleWidget(
                      item.title!, selected, item.selectedTitleColor, item.unSelectedTitleColor),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(
      Widget title, bool selected, Color? selectedColor, Color? unSelectedColor) {
    if (title is Text) {
      final Text originalText = title;
      final TextStyle? originalStyle = originalText.style;
      final Color? colorToApply = selected ? selectedColor : unSelectedColor;

      return Text(
        originalText.data ?? '',
        key: originalText.key,
        style: (originalStyle ?? const TextStyle()).copyWith(color: colorToApply),
        strutStyle: originalText.strutStyle,
        textAlign: originalText.textAlign,
        textDirection: originalText.textDirection,
        locale: originalText.locale,
        softWrap: originalText.softWrap,
        overflow: originalText.overflow,
        textScaleFactor: originalText.textScaleFactor,
        maxLines: originalText.maxLines,
        semanticsLabel: originalText.semanticsLabel,
        textWidthBasis: originalText.textWidthBasis,
        textHeightBehavior: originalText.textHeightBehavior,
      );
    } else {
      return title;
    }
  }
}

/* Model Class */

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
    this.title, // теперь Widget
    this.selectedTitleColor,
    this.unSelectedTitleColor,
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
  final Widget? title;
  final Color? selectedTitleColor;
  final Color? unSelectedTitleColor;
}
