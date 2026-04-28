import '../../../../utils/core_export.dart';
import '../model/bottom_nav_data.dart';
import 'bottom_nav_items.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavItems> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // return SafeArea(
    //   top: false,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    //     decoration: BoxDecoration(
    //       color: Color(0xFFF9F9F9),
    //       borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
    //       boxShadow: [
    //         BoxShadow(
    //           blurRadius: 8,
    //           spreadRadius: 0,
    //           offset: const Offset(4, 0),
    //           color: Colors.grey.withValues(alpha: 0.5),
    //         ),
    //       ],
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 24.0),
    //       child: Container(
    //         color: Colors.grey[200],
    //         child: Row(
    //           children: List.generate(items.length, (index) {
    //             final item = items[index];
    //             final isSelected = currentIndex == index;
    //
    //             return Expanded(
    //               child: BottomNavItem(
    //                 item: item,
    //                 isSelected: isSelected,
    //                 onTap: () => onTap(index),
    //               ),
    //             );
    //           }),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 4,
              offset: const Offset(4, 0),
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [

            /// 🔹 Bottom Bar
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: List.generate(items.length, (index) {

                    if (index == 3) {
                      return const Expanded(child: SizedBox());
                    }

                    final item = items[index];
                    final isSelected = currentIndex == index;

                    return Expanded(
                      child: BottomNavItem(
                        item: item,
                        isSelected: isSelected,
                        onTap: () => onTap(index),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Positioned(
              top: 5,
              child: GestureDetector(
                onTap: () => onTap(3), // center index
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Colors.white,width: 3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}