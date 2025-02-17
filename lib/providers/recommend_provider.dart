import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/recommend_repository.dart';

final recommendRepositoryProvider = Provider<RecommendRepository>((ref) {
  return RecommendRepository();
});
