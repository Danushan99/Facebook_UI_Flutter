import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postHeader(post: post),
                const SizedBox(
                  height: 4.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _postStats(post: post)),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _postHeader extends StatelessWidget {
  final Post post;

  const _postHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} . ',
                    style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.green[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print("more"),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class _postStats extends StatelessWidget {
  final Post post;

  const _postStats({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes} ',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.comments} Comments ',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} shares ',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _postButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'like',
              onTap: () => print('like'),
            ),
            _postButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'comment',
              onTap: () => print('comment'),
            ),
            _postButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'share',
              onTap: () => print('share'),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: camel_case_types
class _postButton extends StatelessWidget {
  final icon;
  final String label;
  final Function onTap;

  const _postButton(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
