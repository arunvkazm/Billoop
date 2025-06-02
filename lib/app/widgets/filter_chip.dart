
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'common_widgets.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        ChoiceChip(
          label: buildGradientText(label),
          selected: isSelected,
          onSelected: (_) => onSelected(),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.transparent,
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
        ),
        Positioned.fill(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.transparent),
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [gradClr1, gradClr2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0,1.0]
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white), // White base border
                  borderRadius: BorderRadius.circular(10), // Match outer radius
                ),
              ),
            ),
          ),
        ),
      ],
    );



  }
}