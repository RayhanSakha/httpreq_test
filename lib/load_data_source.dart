import 'base_network.dart';

class PostsDataSource {
  static PostsDataSource instance = PostsDataSource();

  Future<Map<String, dynamic>> loadPosts() {
    return BaseNetwork.get("posts");
  }
  Future<Map<String, dynamic>> loadUsers(int postsidReceived){
    String postsid = postsidReceived.toString();
    return BaseNetwork.get("users/$postsid");
  }
  Future<Map<String, dynamic>> loadComments(int idReceived){
    String id = idReceived.toString();
    return BaseNetwork.get("comments?postId=$id");
  }
}
