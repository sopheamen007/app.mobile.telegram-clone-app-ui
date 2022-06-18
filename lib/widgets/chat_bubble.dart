import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class CustomBubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;
  final bool isLast;

  const CustomBubbleChat(
      {Key? key,required this.isMe,required this.message,required this.time,required this.isLast})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isMe) {
      if (!isLast) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 16, color: white),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12, color: white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 14, bottom: 10),
                  child: Bubble(
                    nip: BubbleNip.rightBottom,
                    color: primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 16, color: white),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12, color: white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }
    } else {
      if (!isLast) {
        return Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 16, color: white),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12, color: white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Row(
          children: [
            Flexible(
              child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 14, bottom: 10),
                  child: Bubble(
                    nip: BubbleNip.rightBottom,
                    color: greyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 16, color: white),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12, color: white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        );
      }
    }
  }
}
