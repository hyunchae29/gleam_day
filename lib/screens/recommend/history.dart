import 'package:flutter/material.dart';
import '../recommend/introduction.dart';
import '../../repositories/recommend_repository.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final RecommendRepository _recommendRepository = RecommendRepository();
  String _todayDate = '';
  Map<String, dynamic> _historyData = {};

  @override
  void initState() {
    super.initState();
    _todayDate = DateFormat('MM-dd').format(DateTime.now());

    // 임시 데이터 추가
    _historyData = {
      'image': 'assets/images/1.png', // 로컬 이미지 사용
      'title': '과거의 오늘',
      'content':
          ''' 1872년 2월 20일, 뉴욕의 메트로폴리탄 미술관(The Metropolitan Museum of Art)이 개관하였습니다. 이 미술관은 세계에서 가장 큰 미술관 중 하나로, 다양한 시대와 문화의 예술 작품을 소장하고 있습니다. 특히, 고대 이집트의 보석류와 중세 유럽의 장신구 등 다양한 주얼리 컬렉션을 감상할 수 있습니다.
    메트로폴리탄 미술관의 이집트관은 약 3만 점의 유물을 소장하고 있으며, 기원전 3000년부터 서기 4세기까지의 이집트 예술을 다루고 있습니다. 이곳에서는 고대 이집트의 정교한 보석류와 장신구를 통해 당시의 문화와 예술적 감각을 엿볼 수 있습니다.
    또한, 중세 유럽의 장신구 컬렉션은 중세 시대의 예술성과 장인 정신을 보여주는 다양한 작품들로 구성되어 있습니다. 이러한 컬렉션을 통해 중세 유럽의 사회적, 문화적 배경과 함께 주얼리의 발전 과정을 살펴볼 수 있습니다.
    메트로폴리탄 미술관은 이러한 풍부한 주얼리 컬렉션을 통해 방문객들에게 다양한 시대와 문화의 예술적 유산을 감상할 수 있는 기회를 제공합니다.
    더 자세한 정보는 메트로폴리탄 미술관 공식 웹사이트에서 확인하실 수 있습니다.
    ''',
      'link': 'https://www.metmuseum.org/',
    };

    _fetchHistory();
  }

  Future<void> _fetchHistory() async {
    final data = await _recommendRepository.getHistoryByDate(_todayDate);
    if (data != null) {
      setState(() {
        _historyData = data;
      });
    }
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(initialIndex: 2),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _historyData['image'],
              ),
              const SizedBox(height: 10),
              Text(
                DateFormat('M월 d일').format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                _historyData['title'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Text(
                _historyData['content'],
                style: Theme.of(context).textTheme.bodySmall,
              ),
              InkWell(
                onTap: () => _launchURL(_historyData['link']),
                child: Text(
                  _historyData['link'],
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
