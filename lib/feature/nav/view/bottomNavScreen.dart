import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:social_media_ui/feature/creatorButton/view/creator_screen.dart';
import 'package:social_media_ui/feature/nav/controller/bottom_nav_controller.dart';
import 'package:social_media_ui/feature/notification/view/nav_screen.dart';
import 'package:social_media_ui/feature/profile/view/profileScreen.dart';
import 'package:social_media_ui/feature/search/view/search_screen.dart';
import 'package:social_media_ui/feature/shorts/view/ShortsScreen.dart';
import 'package:social_media_ui/feature/subscription/view/subscription_screen.dart';

import '../../../common/enums/common_enums.dart';
import '../../../common/widgets/custom_appBar.dart';
import '../../../utils/core_export.dart';
import '../../home_screen/view/home_screen.dart';
import '../model/bottom_nav_data.dart';
import '../widgets/customBottomNav.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          appBar:controller.currentIndex == 0 ? null : CustomAppbar(
            title: titleName(bottomNav.values[controller.currentIndex]),
          ),

          body: IndexedStack(
            index: controller.currentIndex,
            children: pages,
          ),

          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: controller.currentIndex,
            items: bottomNavItemData,
            onTap: (index) {
              controller.updateCurrentIndex(index);
            },
          ),
        );
      },
    );
  }
}

List<BottomNavItems> bottomNavItemData = [
  BottomNavItems(title: "Home", icon: Images.homeOutlined, highlightedIcon: Images.homeFilled),
  BottomNavItems(title: "Search", icon: Images.searchOutlined, highlightedIcon: Images.searchFilled),
  BottomNavItems(title: "Subscription", icon: Images.subscription, highlightedIcon: Images.subscription),
  BottomNavItems(title: "Creator", icon: "", highlightedIcon: ""),
  BottomNavItems(title: "shorts", icon: Images.playOutlined, highlightedIcon: Images.playFilled),
  BottomNavItems(title: "notification", icon: Images.notificationOutlined, highlightedIcon: Images.notificationFilled),
  BottomNavItems(title: "profile", icon: Images.profileOutlined, highlightedIcon: Images.profileFilled)
];

final List<Widget> pages = const [
  HomeScreen(),
  SearchScreen(),
  SubscritionScreen(),
  CreatorScreen(),
  ShortsScreen(),
  NavScreen(),
  ProfileScreen()
];

String titleName(bottomNav value){
  switch(value) {
    case bottomNav.search:
      return "Search";
    case bottomNav.subscription:
      return "Subscription";
    case bottomNav.newPost:
      return "New Post";
    case bottomNav.shorts:
      return "Shorts";
    case bottomNav.notification:
      return "Notification";
    case bottomNav.profile:
      return "Profile";
    default:
      return "home";
  }
}
