import 'package:flutter/material.dart';
import 'package:gleam_day/common/custom_widget/emoji_top_app_bar.dart';

class AddEmoji extends StatefulWidget {
  const AddEmoji({super.key});

  @override
  State<AddEmoji> createState() => _AddEmojiState();
}

class _AddEmojiState extends State<AddEmoji> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(),
    );
  }
}
