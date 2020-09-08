import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePost extends StatelessWidget {
  final Post post;
  const CreatePost({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              /// CrossAxisAlignment.stretch使子控件填满交叉轴
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _CreatePostHeader(post: post),
                SizedBox(
                  height: 4,
                ),
                Text(
                  post.caption,
                ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl))
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _CreatePostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _CreatePostStats extends StatelessWidget {
  final Post post;
  const _CreatePostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Divider(),
        Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () => print("Like"),
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: Text("Like"),
              ),
              VerticalDivider(),
              FlatButton.icon(
                onPressed: () => print("Comment"),
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: Text("Comment"),
              ),
              VerticalDivider(),
              FlatButton.icon(
                onPressed: () => print("Share"),
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: Text("Share"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CreatePostHeader extends StatelessWidget {
  const _CreatePostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CreateCircleAvatar(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
          ),
          onPressed: () => print("More"),
        ),
      ],
    );
  }
}
