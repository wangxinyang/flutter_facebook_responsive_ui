import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';

class CreateCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  const CreateCircleAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Palette.facebookBlue,
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: hasBorder ? 17 : 20,
              backgroundImage: CachedNetworkImageProvider(imageUrl),
            ),
          ),
          isActive == true
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Palette.online,
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )

              /// 创建一个空组件
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
