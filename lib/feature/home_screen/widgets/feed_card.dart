import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_ui/feature/home_screen/model/feed_data.dart';
import 'package:social_media_ui/helper/time_helper.dart';

import '../../../utils/core_export.dart';
import '../model/sample_model.dart';

class FeedCard extends StatelessWidget {
  final Product post;
  final bool repostHeader;

  const FeedCard({super.key, required this.post,required this.repostHeader});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           repostHeader ? _RepostHeader() : SizedBox(),
          const SizedBox(height: 8),
          _UserHeader(post: post),
          const SizedBox(height: 10),
          _PostContent(text: post.description ?? ""),
          const SizedBox(height: 10),

      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
      child: Column(
        children: [
          _PostImageSection(post: post),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
            vertical: 8),
            child: _EngagementRow(post: post),
          ),],
        ),),],
      ),
    );
  }
}

class _RepostHeader extends StatelessWidget {
  const _RepostHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.repeat, size: 16, color: Colors.grey),
        //SvgPicture.asset(Images.repeat,height: 16,width: 16,),
        SizedBox(width: 4),
        Text(
          "You Reposted",
          style: interMedium.copyWith(color: Colors.grey,fontSize: 12)
        ),
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  final Product post;

  const _UserHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(post.thumbnail ?? ""),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.brand ?? "",
                    style: interSemiBold.copyWith(color: Colors.black87,fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.verified, size: 14, color: Colors.blue),
                ],
              ),
              Text(
                "@${post.sku ?? ""}",
                style: interMedium.copyWith(color: Colors.grey,fontSize: 12)
              ),
            ],
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("${TimeHelper.timeAgo(post.meta?.createdAt)}",
                style: interMedium.copyWith(fontSize: 12)),
            SizedBox(width: 2,),
            const Icon(Icons.more_vert, size: 18),
          ],
        )
      ],
    );
  }
}

class _PostContent extends StatefulWidget {
  final String text;

  const _PostContent({required this.text});

  @override
  State<_PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<_PostContent> {
  bool expanded = false;
  bool isOverflowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: const TextStyle(fontSize: 14),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    isOverflowing = textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: expanded ? null : 2,
          overflow:
          expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: interMedium.copyWith(fontSize: 14)
        ),

        if (isOverflowing)
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Text(
              expanded ? "Show Less" : "Read More",
              style: interRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}

class _PostImageSection extends StatefulWidget {
  final Product post;

  const _PostImageSection({required this.post});

  @override
  State<_PostImageSection> createState() => _PostImageSectionState();
}

class _PostImageSectionState extends State<_PostImageSection> {
  int currentIndex = 0;
  late PageController _controller;

  List<String> get images => widget.post.images ?? [];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox();

    return Stack(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),

        if (images.length > 1)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${currentIndex + 1}/${images.length}",
                style: const TextStyle(
                    color: Colors.white, fontSize: 12),
              ),
            ),
          ),
      ],
    );
  }
}

class _EngagementRow extends StatelessWidget {
  final Product post;

  const _EngagementRow({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconText(Icons.favorite_border, post.price?.toInt() ?? 0),
        _iconText(Icons.comment_outlined, post.reviews?.length ?? 0),
        _iconText(Icons.repeat, post.rating?.toInt() ?? 0),
        _iconText(Icons.visibility_outlined, post.minimumOrderQuantity ?? 0),
        _iconText(Icons.bookmark_border, post.rating?.toInt() ?? 0),
        Row(
          children: [
            const Icon(Icons.share_outlined,size: 14,color: Colors.grey,),
            SizedBox(width: 4,),
            Text(
              "Share",
              style: interMedium.copyWith(color: Colors.grey,fontSize: 12))
          ],
        ),
      ],
    );
  }

  Widget _iconText(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(count.toString(),
            style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}