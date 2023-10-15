import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final double? width;
  final double? height ;

  const SelectableContainer({super.key,
    required this.isSelected,
    required this.onSelected, required this.child, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onSelected(!isSelected);
        },
        child: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Container(
            width: width ?? 54,
            height: height ?? 36,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? Colors.black54 : Colors.black12),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GestureDetector(
              onTap: () {
                onSelected(!isSelected);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: child),
              ),
            ),
          ),
        ));
  }
}

