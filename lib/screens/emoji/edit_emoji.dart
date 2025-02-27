import 'package:flutter/material.dart';
import 'package:gleam_day/common/custom_widget/emoji_top_app_bar.dart';

class EditEmoji extends StatefulWidget {
  const EditEmoji({super.key});

  @override
  State<EditEmoji> createState() => _EditEmojiState();
}

class _EditEmojiState extends State<EditEmoji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
    );
  }
}
