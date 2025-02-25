 # Gleam Day
이 프로젝트는 Flutter로 개발한 데일리 주얼리 추천 앱입니다.

GleamDay는 사용자의 하루 기분을 표현하는 이모지를 기반으로 다양한 악세서리를 추천해주는 앱입니다.
이 앱은 사용자가 선택한 이모지에 맞는 악세서리를 제안함으로써, 일상 속 소소한 즐거움을 제공하고, 그 날의 분위기를 반영한 특별한 아이템을 만나볼 수 있도록 도와줍니다.

## 주요 기능  
이모지 선택: 사용자가 그 날의 기분을 나타내는 이모지를 선택합니다. 
악세서리 추천: 선택된 이모지에 따라 적합한 악세서리를 추천합니다. 각 악세서리는 사용자의 감정을 반영하며, 그 날의 스타일을 한층 돋보이게 합니다. 
메모 기능: 추천된 악세서리에 대한 사용자의 메모를 저장할 수 있어 더 나은 추천 경험을 제공합니다. 
이모지 추가 기능: 나만의 이모지를 추가하여 이모지 리스트에 추가할 수 있습니다. 

## 사용 예시  
오늘의 기분을 "😊" 이모지로 선택하세요. 
GleamDay가 추천하는 다양한 악세서리를 확인할 수 있습니다. 
그리고 마음에 드는 악세서리를 저장하거나 피드백을 남길 수 있습니다. 

## 프로젝트 목표  
이 프로젝트의 목표는 사용자가 일상의 작은 순간에도 자신을 표현하고 즐길 수 있도록 돕는 것입니다. 
악세서리는 단순한 장식 이상의 의미를 지닐 수 있으며, 사용자가 매일 새로운 기분으로 하루를 시작할 수 있도록 긍정적인 에너지를 제공합니다. 

## 추가 예정(2025.01.01)
데이터 관리, 로직, 로그인 기능, REST API

## 프로젝트 구조
``` dart
Gleam Day
├── app_initializer.dart
├── common
│   ├── loading.dart
│   ├── message.dart
│   ├── recommend_message.dart
│   └── warning_page.dart
├── core
│   ├── error_handler.dart
│   └── theme.dart
├── database
│   ├── firebase
│   └── sqlite
│       └── database_helper.dart
├── firebase_options.dart
├── main.dart
├── models
│   ├── auth_model.dart
│   ├── emoji_model.dart
│   ├── member_model.dart
│   ├── note_model.dart
│   └── recommend_model.dart
├── providers
│   ├── auth_provider.dart
│   ├── emoji_provider.dart
│   ├── member_provider.dart
│   ├── note_provider.dart
│   └── recommend_provider.dart
├── repositories
│   ├── apple_auth_repository.dart
│   ├── auth_repository.dart
│   ├── emoji_repository.dart
│   ├── google_auth_repository.dart
│   ├── kakao_auth_repository.dart
│   ├── member_repository.dart
│   ├── note_repository.dart
│   └── recommend_repository.dart
└── screens
    ├── emoji
    │   ├── add_emoji.dart
    │   ├── add_emoji_new.dart
    │   ├── edit_emoji.dart
    │   ├── edit_emoji_detail.dart
    │   ├── edit_emoji_select.dart
    │   └── emoji_main.dart
    ├── member
    │   ├── member_main.dart
    │   └── member_settings.dart
    ├── note
    │   ├── add_note.dart
    │   ├── note_main.dart
    │   └── recommend_list.dart
    ├── recommend
    │   ├── fortune.dart
    │   ├── history.dart
    │   ├── introduction.dart
    │   ├── new_recommendation.dart
    │   ├── recommendation.dart
    │   └── result.dart
    ├── routers
    │   ├── app_router.dart
    │   └── frame_page.dart
    └── start_page.dart

```
## 사용 기술
- **Flutter**: 크로스 플랫폼 UI 개발
- **Dart**: Flutter의 프로그래밍 언어로 전체 로직 구현
- **SQLite**: 오프라인 데이터 저장
- **Firebase**: 사용자 인증 및 데이터 동기화
- **Riverpod**: 상태 관리 및 데이터 로직 처리
- **MVVM**: 클린 아키텍처 적용
