import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gleam_day/common/custom_widget/emoji_top_app_bar.dart';
import 'package:gleam_day/providers/emoji_provider.dart';

class EmojiMain extends ConsumerWidget {
  const EmojiMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newEmojis = ref.watch(newEmojiProvider);
    final editedEmojis = ref.watch(editedEmojiProvider);

    return Scaffold(
      appBar: TopAppBar(
        initialIndex: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/emoji_main.png'), // 나중에 변경
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이모지',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          '새로 만들거나 기존의 이모지를 수정할 수 있어요!',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildEmojiSection(context, "새로 만든 이모지", newEmojis),
            _buildEmojiSection(context, "수정한 이모지", editedEmojis),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiSection(
      BuildContext context, String title, List<String> emojis) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, title),
        emojis.isNotEmpty
            ? _buildEmojiGrid(emojis)
            : _buildEmptyMessage(context, title),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }

  Widget _buildEmojiGrid(List<String> emojis) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: emojis.length,
        itemBuilder: (context, index) {
          return _buildEmojiCard(emojis[index]);
        },
      ),
    );
  }

  Widget _buildEmojiCard(String emojiName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/emoji.png'), // 나중에 변경
          ),
          SizedBox(height: 8),
          Text(emojiName, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildEmptyMessage(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title == "새로 만든 이모지" ? "새로 추가된 이모지가 없습니다." : "수정한 이모지가 없습니다.",
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
