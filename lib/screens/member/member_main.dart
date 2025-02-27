import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../providers/member_provider.dart';

class MemberMain extends ConsumerWidget {
  const MemberMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(kakaoAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('MY', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user == null
                    ? '로그인'
                    : '환영합니다, ${user.kakaoAccount?.profile?.nickname}님!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              if (user == null) ...[
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('이메일로 가입',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('비밀번호 찾기',
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '로그인',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/kakao_icon.png'),
                      ),
                      onPressed: () =>
                          ref.read(kakaoAuthProvider.notifier).login(),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/google_icon.svg',
                        width: 40,
                        height: 40,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/apple_icon.png'),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ] else ...[
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(kakaoAuthProvider.notifier).logout(),
                  child: Text(
                    '로그아웃',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              const Divider(
                thickness: 1,
                height: 30,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '캐시 지우기',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/my/settings');
                      },
                      child: Text(
                        '알람 설정',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'noday29@gmail.com',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
