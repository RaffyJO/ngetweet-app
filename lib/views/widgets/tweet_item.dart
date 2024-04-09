import 'package:flutter/material.dart';
import 'package:ngetweet/models/tweet_model.dart';
import 'package:ngetweet/shared/methods.dart';
import 'package:ngetweet/shared/theme.dart';

class TweetItem extends StatefulWidget {
  final Tweet tweet;
  const TweetItem({super.key, required this.tweet});

  @override
  State<TweetItem> createState() => _TweetItemState();
}

class _TweetItemState extends State<TweetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                'assets/img-profile-default.jpg',
                fit: BoxFit.cover,
                width: 55,
                height: 55,
              ),
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'sdsd',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    horizontalSpace(2),
                    Text(
                      '@dsdsdsd',
                      style: TextStyle(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                    horizontalSpace(2),
                    Text(
                      '•1h',
                      style: TextStyle(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.tweet.body,
                        style: kTweetStyle,
                      )
                    ],
                  ),
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon-comment.png',
                            width: 15,
                            height: 15,
                          ),
                          horizontalSpace(4),
                          Text(
                            widget.tweet.totalComment.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: greyColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon-retweet.png',
                            width: 15,
                            height: 15,
                          ),
                          horizontalSpace(4),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: greyColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon-like.png',
                            width: 15,
                            height: 15,
                          ),
                          horizontalSpace(4),
                          Text(
                            widget.tweet.likes.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: greyColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon-share.png',
                            width: 15,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icon-down-arrow.png',
            width: 10,
            height: 5,
          ),
        ],
      ),
    );
  }
}
