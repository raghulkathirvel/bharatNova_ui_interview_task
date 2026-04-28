import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_ui/feature/nav/controller/bottom_nav_controller.dart';

import '../../utils/core_export.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;
  final bool isClose;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final double elevation;
  final Color? backgroundColor;

  const CustomAppbar({
    super.key,
    this.title,
    this.showLeading = true,
    this.isClose = false,
    this.onLeadingTap,
    this.actions,
    this.elevation = 0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white
      ),
      elevation: elevation,
      backgroundColor: backgroundColor ?? Colors.transparent,
      centerTitle: false,
      titleSpacing: showLeading ? 0:12,
      automaticallyImplyLeading: false,
      title: (title != null && title!.isNotEmpty) ?
      Text(title!, style: interSemiBold.copyWith(color: theme.primaryColor, fontSize: 20,),) : null,

      leading: showLeading
          ? GestureDetector(
        onTap: onLeadingTap ?? (){
          Get.find<BottomNavController>().updateCurrentIndex(0);
        },
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //border: Border.all(color: theme.primaryColor, width: 1,),
          ),
          child: Center(
            child: Icon(
              isClose ? Icons.close : Icons.arrow_back,
              color: theme.primaryColor,
              size: 20,
            ),
          ),
        ),
      ) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
