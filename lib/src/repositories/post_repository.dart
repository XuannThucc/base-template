import 'package:template/src/models/response/post.dart';
import 'package:template/src/network/endpoint.dart';

import '../di/dependencies.dart';
import '../network/api_provider.dart';

class PostRepository {
  final ApiProvider _apiProvider = getIt.get<ApiProvider>();

  Future<List<PostData>> getPosts() async {
    List<PostData> posts = [];
    final res = await _apiProvider.get(ApiEndpoint.post, needToken: false);
    res['data'].forEach((e) => posts.add(PostData.fromJson(e)));
    return posts;
  }
}