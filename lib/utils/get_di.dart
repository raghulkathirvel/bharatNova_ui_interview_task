import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_media_ui/feature/home_screen/controller/feed_controller.dart';
import 'package:social_media_ui/feature/home_screen/repository/home_screen_repo.dart';
import 'package:social_media_ui/feature/location/controller/location_controller.dart';
import 'package:social_media_ui/feature/nav/controller/bottom_nav_controller.dart';

void init = {
  Get.lazyPut(() => BottomNavController()),
  Get.lazyPut(() => LocationController()),
  Get.lazyPut(() => FeedController(homeRepo: Get.find())),

  Get.lazyPut(() => FeedRepo()),
};