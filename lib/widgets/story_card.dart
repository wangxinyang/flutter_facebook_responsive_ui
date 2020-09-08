import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class StoryCard extends StatelessWidget {
  final bool isAdd;
  final User currentUser;
  final Story story;
  const StoryCard({
    Key key,
    @required this.isAdd,
    @required this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAdd ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: isAdd
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      onPressed: () => print("Add story"),
                      iconSize: 30,
                      color: Palette.facebookBlue,
                    ),
                  )
                : CreateCircleAvatar(
                    imageUrl: story.user.imageUrl,
                    // hasBorder: !story.isViewed,
                    hasBorder: true,
                  ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              isAdd ? "Add to Story" : story.user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
