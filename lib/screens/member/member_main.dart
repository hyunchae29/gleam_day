import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemberMain extends StatelessWidget {
  const MemberMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  '로그인',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
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
                      borderSide: BorderSide(color: Colors.black), // 기본 밑줄 색상
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, width: 2), // 포커스 시 밑줄 색상
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
                //const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SizedBox(
                            width: 50, // 원하는 크기 지정
                            height: 50,
                            child: Image.asset('assets/kakao_icon.png'),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/google_icon.svg', // PNG 대신 SVG 파일 경로
                            //   width: 24, // 크기 조절 가능
                            //   height: 24,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: SizedBox(
                            width: 40, // 원하는 크기 지정
                            height: 40,
                            child: Image.asset('assets/apple_icon.png'),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    const Divider(
                      thickness: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '캐시 지우기',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '알람 설정',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'About Developer',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
