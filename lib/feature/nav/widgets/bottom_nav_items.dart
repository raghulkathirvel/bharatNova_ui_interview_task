import 'package:flutter_svg/svg.dart';

import '../../../../utils/core_export.dart';
import '../model/bottom_nav_data.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavItems item;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color activeColor = theme.primaryColor;
    final Color inactiveColor = Colors.grey;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),

        child: SvgPicture.asset(
          isSelected ? item.highlightedIcon : item.icon,
          height: 18,
          width: 18,
          colorFilter: ColorFilter.mode(
            isSelected ? activeColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}