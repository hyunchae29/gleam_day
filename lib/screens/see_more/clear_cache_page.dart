import 'package:flutter/material.dart';

class ClearCachePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('캐시 삭제'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showClearCacheDialog(context);
          },
          child: const Text('캐시 삭제하기'),
        ),
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('캐시를 삭제할까요?'),
        content: const Text('삭제된 캐시는 복구할 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('캐시가 삭제되었습니다.')),
              );
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }
}
