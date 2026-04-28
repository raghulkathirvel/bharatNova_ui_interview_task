import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_media_ui/feature/home_screen/controller/feed_controller.dart';
import 'package:social_media_ui/feature/home_screen/widgets/feed_card.dart';

import '../../../utils/core_export.dart';
import 'feedCard_skeleton.dart';

class FeedCardList extends StatefulWidget {
  const FeedCardList({super.key});

  @override
  State<FeedCardList> createState() => _FeedCardListState();
}

class _FeedCardListState extends State<FeedCardList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final controller = Get.find<FeedController>();
    controller.getProductList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {

        controller.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (feedController) {

        if (feedController.isLoading) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (_, __) => const FeedCardSkeleton(),
          );
        }

        final posts = feedController.posts;

        if (posts.isEmpty) {
          return const Center(child: Text("No Post at this time!"));
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: posts.length + (feedController.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {

            if (index == posts.length) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final postData = posts[index];
            bool repostNeed = index % 3 == 0;

            return FeedCard(
              post: postData,
              repostHeader: repostNeed,
            );
          },
        );
      },
    );
  }
}
