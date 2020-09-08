import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/conifg/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CreateCircleAvatar(
              imageUrl: onlineUsers[index - 1].imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: 8),
      onPressed: () => print("create room"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        color: Colors.blueAccent[100],
        width: 3,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          // 作用于子部件上的颜色渐变遮罩
          ShaderMask(
            shaderCallback: (rect) {
              return Palette.createRoomGradient.createShader(rect);
            },
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text("Create\n Room"),
        ],
      ),
    );
  }
}
