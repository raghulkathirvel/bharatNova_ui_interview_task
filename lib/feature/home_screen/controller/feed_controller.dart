import 'dart:developer';

import 'package:get/get.dart';
import 'package:social_media_ui/feature/home_screen/model/feed_data.dart';
import 'package:social_media_ui/feature/home_screen/repository/home_screen_repo.dart';

class FeedController extends GetxController implements GetxService {
  final FeedRepo homeRepo;

  FeedController({required this.homeRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  List<Product> _posts = [];
  List<Product> get posts => _posts;

  int limit = 10;
  int skip = 0;
  int total = 0;

  Future<void> getProductList(bool isReload) async {

    if(isReload) {_posts.clear();}
    if (_posts.isNotEmpty ) return;
    _isLoading = true;
    update();

    try {
      final response = await homeRepo.getFeedData(limit, skip);

      _posts = response.products ?? [];
      total = response.total ?? 0;

    } catch (e) {
      log("Error: $e");
    }

    _isLoading = false;
    update();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore) return;

    if (_posts.length >= total) return;

    _isLoadingMore = true;
    update();

    skip += limit;

    try {
      final response = await homeRepo.getFeedData(limit, skip);

      _posts.addAll(response.products ?? []);

    } catch (e) {
      log("Pagination Error: $e");
    }

    _isLoadingMore = false;
    update();
  }
}