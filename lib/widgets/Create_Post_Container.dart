// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                  isActive: false,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'what\'s on your mind?'),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton.icon(
                    onPressed: () => print("live"),
                    icon: const Icon(Icons.videocam, color: Colors.red),
                    label: Text("live"),
                  ),
                  VerticalDivider(
                    width: 8.0,
                  ),

                  // ignore: deprecated_member_use
                  FlatButton.icon(
                    onPressed: () => print("Photo"),
                    icon: const Icon(Icons.photo_library, color: Colors.green),
                    label: Text("Photo"),
                  ),
                  VerticalDivider(
                    width: 8.0,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton.icon(
                    onPressed: () => print("Room"),
                    icon: const Icon(Icons.video_call,
                        color: Colors.purpleAccent),
                    label: Text("Room"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
