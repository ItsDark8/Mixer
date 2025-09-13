import 'package:flutter/material.dart';

class AnimatedFilterItem extends StatefulWidget {
  final bool haveIcon;
  final IconData? icon;
  final String text;
  final Color primaryColor;
  final Color changeColor;
  final bool needArrowIcon;

  const AnimatedFilterItem({
    Key? key,
    required this.haveIcon,
    this.icon,
    required this.text,
    required this.primaryColor,
    required this.changeColor,
    this.needArrowIcon = true,
  }) : super(key: key);

  @override
  _AnimatedFilterItemState createState() => _AnimatedFilterItemState();
}

class _AnimatedFilterItemState extends State<AnimatedFilterItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = _isExpanded ? widget.changeColor.withOpacity(0.2) : Colors.white;
    Color iconColor = _isExpanded ? widget.changeColor : widget.primaryColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: _toggleExpand,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.haveIcon && widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(widget.icon, color: iconColor),
              ),
            Flexible(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.needArrowIcon) ...[
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: iconColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
