import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CreateCircleAvatar(
                imageUrl: currentUser.imageUrl,
                isActive: false,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      onPressed: () {},
                      child: Text(
                        "What's on your mind?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            // 分割线区域的高度
            height: 10,
            // 分割线的粗细
            thickness: 1.5,
          ),
          Container(
            // 指定了高度VerticalDivider才显示
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print("Live"),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text("Live"),
                ),

                /// VerticalDivider的高度是跟随父组件的高度，
                /// 所以遇到这种情况时需要给父组件指定高度才能显示
                VerticalDivider(
                  width: 8,
                ),
                FlatButton.icon(
                  onPressed: () => print("Photo"),
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text("Live"),
                ),
                VerticalDivider(
                  width: 8,
                ),
                FlatButton.icon(
                  onPressed: () => print("Room"),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text("Room"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
