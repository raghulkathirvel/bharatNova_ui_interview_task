import 'package:shimmer/shimmer.dart';

import '../../../utils/core_export.dart';

class FeedCardSkeleton extends StatelessWidget {
  const FeedCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 Repost Header
          Row(
            children: const [
              SkeletonBox(width: 16, height: 16),
              SizedBox(width: 6),
              SkeletonBox(width: 80, height: 10),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔹 User Header
          Row(
            children: [
              const SkeletonBox(
                width: 40,
                height: 40,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SkeletonBox(width: 120, height: 12),
                    SizedBox(height: 6),
                    SkeletonBox(width: 100, height: 10),
                    SizedBox(height: 6),
                    SkeletonBox(width: 80, height: 10),
                  ],
                ),
              ),

              const SkeletonBox(width: 20, height: 20),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 Content Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SkeletonBox(width: double.infinity, height: 10),
              SizedBox(height: 6),
              SkeletonBox(width: double.infinity, height: 10),
              SizedBox(height: 6),
              SkeletonBox(width: 200, height: 10),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 Image Section
          const SkeletonBox(
            width: double.infinity,
            height: 220,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          const SizedBox(height: 12),

          /// 🔹 Engagement Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SkeletonBox(width: 40, height: 10),
              SkeletonBox(width: 40, height: 10),
              SkeletonBox(width: 40, height: 10),
              SkeletonBox(width: 40, height: 10),
              SkeletonBox(width: 20, height: 20),
            ],
          ),
        ],
      ),
    );
  }
}


class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}