import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_media_ui/feature/home_screen/controller/feed_controller.dart';
import 'package:social_media_ui/feature/home_screen/widgets/feedCard_skeleton.dart';
import 'package:social_media_ui/feature/location/controller/location_controller.dart';
import 'package:social_media_ui/utils/core_export.dart';

import '../../../utils/Images.dart';
import '../../location/model/location_model.dart';
import '../model/sample_model.dart';
import '../widgets/feed_card.dart';
import '../widgets/feed_card_List.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Get.find<FeedController>().getProductList(false);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Stack(
            alignment: Alignment.center,
            children: [

              Center(
                child: Image.asset(
                  Images.logoName,
                  width: 150,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Images.menuButton,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: GetBuilder<LocationController>(
                    builder: (controller) {


                      final locationText = getLocationText(controller.userLocation);

                      if (controller.isLoading && locationText == null) {
                        return SkeletonBox(width: 80, height: 10);
                      }

                      if (locationText == null || locationText.isEmpty) {
                        return  SizedBox();
                      }

                      final words = locationText.trim().split(" ");

                      final isTwoWords = words.length == 2;
                      final isMoreThanTwo = words.length > 2;

                      String firstLine = "";
                      String secondLine = "";

                      if (isMoreThanTwo) {
                        firstLine = words.take(2).join(" ");
                        secondLine = words.skip(2).join(" ");
                      }

                      return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 2),

                        if (isMoreThanTwo)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                firstLine,
                                style: interRegular.copyWith(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  height: 1.1,
                                ),
                              ),
                              Text(
                                secondLine,
                                style: interRegular.copyWith(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  height: 1.1,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        else
                          Flexible(
                            child: Text(
                              locationText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: interRegular.copyWith(
                                color: Colors.black87,
                                fontSize: isTwoWords ? 10 : 12,
                              ),
                            ),
                          ),
                      ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  insets: const EdgeInsets.symmetric(horizontal: -30),
                ),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).shadowColor,
                unselectedLabelStyle: interMedium.copyWith(color: Theme.of(context).dividerColor,fontSize: 14),
                tabs: const [
                  Tab(text: "Post"),
                  Tab(text: "Nova"),
                  Tab(text: "News"),
                  Tab(text: "Article"),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            FeedCardList(),
            Center(child: Text("Nova Screen")),
            Center(child: Text("News Screen")),
            Center(child: Text("Article Screen")),
          ],
        ),
      ),
    );
  }

  String? getLocationText(UserLocation? location) {
    return location?.city?.trim().isNotEmpty == true
        ? location!.city
        : location?.state?.trim().isNotEmpty == true
        ? location!.state
        : location?.country;
  }
}
